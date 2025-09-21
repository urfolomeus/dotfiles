# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/src/tools/terravision


# ENV VARS
# set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true
