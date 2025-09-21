# GENERAL
alias :q='exit'
alias c='clear'
alias dy="dig +noall +answer +additional +short $argv[1] @dns.toys"
alias nudge='source ~/.config/fish/config.fish'
alias serve="python -m http.server"
alias tsz="TZ='UTC' ts -m '%Y-%m-%dT%H:%M:%.S%z'"

# DOCKER
alias dk='docker'
alias dkc='docker compose'

# EZA
alias els='eza --icons=always --long --all -I .git'
alias ela='eza --icons=always --long --all -I .git --no-permissions --no-filesize --no-user --no-time'
alias elaf='eza --icons=always --long --all -I .git --no-permissions --no-user --no-time'
alias tree='eza --icons=always --tree --all -I ".git|.venv|node_modules"'


# GIT
alias ga="git add -A"
alias gb="git br"
alias gba="git bra"
alias gcl="git clone"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gfo="git fetch origin"
alias gi="git init"
alias gl="git hist"
alias glfp="git histfp"
alias gm="git merge"
alias gpl="git pull"
alias gplo="git pull origin"
alias gpr="git pull --rebase"
alias gpro="git pull --rebase origin"
alias gps="git push"
alias gpsh="git push heroku"
alias gpso="git push origin"
alias grh="git reset HEAD"
alias gs="git st"
alias gst="git stash"
alias gsta="git stash apply"


# KUBERNETES
alias k="kubectl"
alias kall="kubectl api-resources --verbs=list --namespaced -o name | sort | grep -v events | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kd="kubectl describe"
alias kl="kubectl logs -f"
alias kn="kubens"
alias ktx="kubectx"
alias kx="kubectl config get-contexts"


# PYTHON
alias ip="ipython"


# RUBY
alias be="bundle exec"


# TERRAFORM
alias tf="terraform"

# ZOXIDE
alias cd="z"

