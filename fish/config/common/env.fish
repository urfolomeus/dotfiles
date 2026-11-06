# ENV VARS
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx fish_greeting "🤖 Smiley day to ya!"

# pnpm
set -gx PNPM_HOME "/Users/alan/Library/pnpm"
fish_add_path -g $PNPM_HOME
# pnpm end

# PATH
fish_add_path -g $HOME/.asdf/shims    # added by asdf
fish_add_path -g $HOME/.docker/bin    # added by Docker Desktop
fish_add_path -g $HOME/.lmstudio/bin  # added by LM Studio CLI (lms)
fish_add_path -g $HOME/.codeium/windsurf/bin  # added by Windsurf

fish_add_path $HOME/src/personal/scripts/bin
