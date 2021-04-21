###
# FZF
###
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'


###
# History
###

# Env Vars
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000

# Options
setopt HIST_VERIFY
setopt EXTENDED_HISTORY      # save each command's beginning timestamp and the duration to the history file
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY    # this is default, but set for share_history
setopt SHARE_HISTORY         # Share history file amongst all Zsh sessions

# Search from cursor
# found this here: https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys

# load required functions
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# use them
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# bind up and down arrows for use

# NOTE: original tutorial had "^[[A" and "^[[B". This worked fine in OSX but
# didn't work in Pop!OS. However I found by hitting ^v (default binding
# to discover key bindings in Pop!OS) followed by key I wanted code for that
# the else block worked
if  [[ "$OSTYPE" == "darwin"* ]]; then
  UP="^[[A"
  DOWN="^[[B"
else
  UP="^[OA"
  DOWN="^[OB"
fi

bindkey "$UP" up-line-or-beginning-search # Up
bindkey "$DOWN" down-line-or-beginning-search # Down


###
# ASDF
###
. $HOME/.asdf/asdf.sh

###
# pyenv
###
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

###
# DIRENV
###
eval "$(direnv hook zsh)"

