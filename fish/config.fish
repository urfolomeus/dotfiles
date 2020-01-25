if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

source /usr/local/opt/asdf/asdf.fish
source /usr/local/share/fish/vendor_completions.d/asdf.fish

set fish_greeting "Do you want me to sit in a corner and rust, or just fall apart where I’m standing?"

set -gx EDITOR "vim"
set -gx DEFAULT_USER "alangardner"
set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk-1.8.0_162.jdk/Contents/Home"
set -gx GOPATH $HOME/src/go
set -gx KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac" # don't install Java when building Erlang

# path
set -gx fish_user_paths "/Applications/Postgres.app/Contents/Versions/latest/bin" $fish_user_paths
# set -gx fish_user_paths "/Users/alangardner/.config/yarn/global" $fish_user_paths
set -g fish_user_paths "/usr/local" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
# set -gx fish_user_paths $GOPATH/bin $fish_user_paths
set -gx PKG_CONFIG_PATH "/usr/local/opt/libxml2/lib/pkgconfig"


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
alias md="mkdir"
alias nudge="source ~/.config/fish/config.fish"
alias serve='python -m SimpleHTTPServer'
alias todos="code ~/Dropbox\ \(Personal\)/Apps/TaskMator"

# docker
alias dcu="docker-compose up"

# elixir
alias imx="iex -S mix"
alias ipx="iex -S mix phx.server"

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

# javascript
alias npmls="npm ls --depth=0"

# postgres
alias pg="postgres -D /usr/local/var/postgres"
alias pgd="nohup postgres -D /usr/local/var/postgres > /tmp/pg.log 2>&1"

# rails
alias be="bundle exec"
alias ber="clear; and bundle exec rspec"
alias berr="clear; and bundle exec rubocop; and bundle exec rspec"
alias berk="clear; and bundle exec rake"
alias beru="be rubocop"
alias br="bin/rails"
alias migrate="bin/rails db:migrate; and env RAILS_ENV=test bin/rails db:migrate"
alias rc="bundle exec rails c"
alias rr="clear; and bundle exec rake routes"
alias rs="bundle exec rails s"
alias rT="clear; and bundle exec rake -T"

# ruby
function openrubydoc
  set v (ruby --version | egrep -o '(\d+\.)+\d+')
  open "https://ruby-doc.org/core-$v/"
end

alias rd=openrubydoc

# vagrant
alias vg="vagrant"
alias vu="vagrant up"
alias vs="vagrant ssh"

# add work stuff
source ~/.config/fish/deliveroo.fish
