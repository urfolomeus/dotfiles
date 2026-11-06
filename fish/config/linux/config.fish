# Environment variables
__source_required ~/.config/fish/config/common/env.fish
__source_required ~/.config/fish/config/linux/env.fish

# Prompt
__source_required ~/.config/fish/config/common/prompt.fish

# System
__source_required ~/.config/fish/config/common/system.fish
__source_required ~/.config/fish/config/linux/system.fish

# Aliases
# NOTE: aliases are sourced last so they have access to any env vars set.
__source_required ~/.config/fish/config/common/aliases.fish
__source_required ~/.config/fish/config/linux/aliases.fish
