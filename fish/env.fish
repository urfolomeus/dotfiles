# PATH
fish_add_path $HOME/.local/share/instantclient_19_8
fish_add_path $HOME/.poetry/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/cython/bin

# ENV VARS
set -gx SDKROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
set -gx ORACLE_HOME "/Users/alan/.local/share/instantclient_19_8"
set -gx DYLD_LIBRARY_PATH "/Users/alan/.local/share/instantclient_19_8"
