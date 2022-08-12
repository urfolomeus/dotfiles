# PATH
fish_add_path $HOME/.local/share/instantclient_19_8
fish_add_path $HOME/.poetry/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/cython/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/openssl@3/bin
fish_add_path $HOME/.asdf/bin


# ENV VARS
set -gx SDKROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
set -gx ORACLE_HOME "/Users/alan/.local/share/instantclient_19_8"
set -gx DYLD_LIBRARY_PATH "/Users/alan/.local/share/instantclient_19_8"
set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/openblas/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/llvm/include -I/opt/homebrew/opt/openblas/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl@3/lib/pkgconfig"
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
