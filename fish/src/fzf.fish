# Initialize fzf
fzf --fish | source

# Setup fzf key bindings and fuzzy completion (needs fd)
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix "
set -gx FZF_DEFAULT_OPTS "--height 50% --layout=default --border --color=hl:#2dd4bf"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Setup previews (needs bat and eza)
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always -n --line-range :500 {}'"
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

