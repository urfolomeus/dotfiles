# Environment variables
__source_required ~/.config/fish/config/common/env.fish
__source_required ~/.config/fish/config/mac/env.fish

# Prompt
__source_required ~/.config/fish/config/common/prompt.fish

# System
__source_required ~/.config/fish/config/common/system.fish
__source_required ~/.config/fish/config/mac/system.fish

# Completions
__source_required ~/.config/fish/config/mac/completions.fish

# Aliases
# NOTE: aliases are sourced last so they have access to any env vars set.
__source_required ~/.config/fish/config/common/aliases.fish
__source_required ~/.config/fish/config/mac/aliases.fish

# Ensure asdf shims win over anything added above (e.g. Homebrew's python3).
fish_add_path -gm $HOME/.asdf/shims
