# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.asdf/bin


# ENV VARS
set -gx EDITOR "nvim"
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
