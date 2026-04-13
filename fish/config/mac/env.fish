# PATH
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/src/tools/terravision


# ENV VARS
# set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true

# Homebrew requirements
set -gx LDFLAGS "-L$(brew --prefix openssl)/lib"
set -gx CPPFLAGS "-I$(brew --prefix openssl)/include"

# Needed to get passed issues installing postgres via asdf (icu4c error)
set -gx PKG_CONFIG_PATH "/opt/homebrew/bin/pkg-config:$(brew --prefix openssl)/lib/pkgconfig:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

