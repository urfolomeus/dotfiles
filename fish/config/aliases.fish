# GENERAL
# =======

alias :q='exit'
alias c='clear'
# # Note: `> /dev/null` means "write to /dev/null instead of stdout", i.e. don't output to the terminal
# #	`2>&1` means "write stderr to stdout", when combined with the above also sends stderr to /dev/null
# #	combined this means "don't write out anything to the terminal", i.e. run in the background
# #	the final & has the effect of running the command in the background
# #	see https://linuxize.com/post/how-to-run-linux-commands-in-background/ for more info
# alias dg='/home/alangardner/.local/share/DataGrip-2020.3/bin/datagrip.sh > /dev/null 2>&1 &'
alias dy="dig +noall +answer +additional +short $argv[1] @dns.toys"
alias nudge='source ~/.config/fish/config.fish'
# alias reclaim='sudo swapoff -a; sudo swapon -a'
alias serve="python -m http.server"
alias tsz="TZ='UTC' ts -m '%Y-%m-%dT%H:%M:%.S%z'"


# WSL SPECIFIC
# ============
# npm i -g wsl-open to use the alias below
alias xdg-open='wsl-open'

# # grep commands
# # alias grep='grep --color -nr'


# # UBUNTU SPECIFIC
# # ===============
# alias open='xdg-open'


# DOCKER
# ======
alias dk='docker'
alias dkc='docker compose'


# GIT
# ===
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
# ==========
alias k="kubectl"
alias kall="kubectl api-resources --verbs=list --namespaced -o name | sort | grep -v events | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kd="kubectl describe"
alias kl="kubectl logs -f"
alias kn="kubens"
alias ktx="kubectx"
alias kx="kubectl config get-contexts"


# PYTHON
# ======
alias ip="ipython"


# # RUBY
# # ====
# alias be="bundle exec"


# TERRAFORM
# =========
alias tf="terraform"

