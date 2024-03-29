# user local bin and share
export PATH="${HOME}/.local/bin:${HOME}/.local/share:$PATH"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pfetch defaults
export PF_INFO="ascii title os kernel wm de shell editor host uptime"
