source ~/.asdf/asdf.fish

set fish_greeting ""

set -gx EDITOR "nvim"
set -gx DEFAULT_USER "alangardner"
set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk-1.8.0_162.jdk/Contents/Home"

# path
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -gx fish_user_paths "/Users/alangardner/.asdf/installs/nodejs/10.2.1/.npm/bin" $fish_user_paths


# enable Erlang shell history
set -gx ERL_AFLAGS "-kernel shell_history enabled"

# options for FZF
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'


##
# aliases
##

# general
alias :q="exit"
alias c="clear"
alias ed="nvim"
alias md="mkdir"
alias nudge="source ~/.config/fish/config.fish"
alias pg="postgres -D /usr/local/var/postgres"
alias pgd="nohup postgres -D /usr/local/var/postgres > /tmp/pg.log 2>&1"
alias serve='python -m SimpleHTTPServer'

# git
alias ga="git add ."
alias gap="git add -p"
alias gb="git br"
alias gba="git bra"
alias gc="git commit"
alias gcl="git clone"
alias gcm="git commit -m"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdt="git difftool"
alias gdt="git difftool --cached"
alias gl="git hist"
alias gs="git st"
alias gst="git stash"
alias gstp="git stash pop"

# elixir
alias imx="iex -S mix"
alias ipx="iex -S mix phx.server"

# javascript
alias npmls="npm ls --depth=0"

# rails
alias be="bundle exec"
alias ber="clear; and bundle exec rspec"
alias berr="clear; and bundle exec rubocop; and bundle exec rspec"
alias berk="clear; and bundle exec rake"
alias beru="be rubocop"
alias br="bin/rails"
alias migrate="bin/rails db:migrate; and env RAILS_ENV=test bin/rails db:migrate"
alias rc="bundle exec rails c"
alias rg="bundle exec rails g"
alias rs="bundle exec rails s"

# rake
alias rr="clear; and bundle exec rake routes"
alias rT="clear; and bundle exec rake -T"
