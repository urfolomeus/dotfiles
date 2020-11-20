# FUNCTIONS
# =========

function mcd() {
  mkdir -p $1 && cd $1
}


# GENERAL
# =======

alias :q='exit'
alias c='clear'
alias mcd='mcd'
alias nudge='source ~/.zshrc'
alias reclaim='sudo swapoff -a; sudo swapon -a'

# grep commands
# alias grep='grep --color -nr'

# ls commands
alias ls='ls -h -G'
alias la='ls -lA'


# UBUNTU SPECIFIC
# ===============
alias open='xdg-open'


# DOCKER
# ======
alias dk='docker'
alias dkc='docker-compose'


# GIT
# ===
alias ga="git add -A"
alias gb="git br"
alias gba="git bra"
alias gcl="git clone"
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
# ==========
alias k="kubectl"
alias kc="kubectl config"
alias kd="kubectl delete"
alias ke="kubectl exec"
alias ki="kubectl exec -it"
alias kg-"kubectl get"
alias kl="kubectl logs -f"
alias kx="kubectl config get-contexts"


# RUBY
# ====
alias be="bundle exec"

