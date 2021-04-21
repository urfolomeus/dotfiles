
### Segment drawing

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  echo -n "%{$bg%}%{$fg%}"
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  echo -n "%{%k%}%{%f%}"
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment blue white "%(!.%{%F{yellow}%}.) $user@%m "
    prompt_segment NONE white " "
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi
    echo -n " ${ref/refs\/heads\//$PL_BRANCH_CHAR } "
  fi
}

# Lang Version

prompt_lang() {
  local version

  version=$(asdf which $1)

  if [[ "$version" != "No version set for $1" ]]; then
    prompt_segment NONE black " "
    prompt_segment NONE $2 "[$1-$version]"
  fi
}

prompt_asdf() {
  prompt_lang ruby red
  prompt_lang elixir magenta
  prompt_lang nodejs yellow
}

# Dir: current working directory
prompt_dir() {
  prompt_segment NONE white '%~'
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_context
  prompt_dir
  #prompt_asdf <- very slow see if there's a better way
  prompt_end
}

RPROMPT='$(prompt_git)'

PROMPT='
%{%f%b%k%}$(build_prompt)
» '
