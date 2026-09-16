set -g __config_load_failed 0

function __source_required --description 'Source a config file, or complain loudly if it is missing'
  if test -f $argv[1]
    source $argv[1]
  else
    echo "config.fish: missing expected config file: $argv[1]" >&2
    echo "  Your fish environment is only partially loaded. This usually means the" >&2
    echo "  dotfiles are not fully checked out or a symlink is broken." >&2
    set -g __config_load_failed 1
    return 1
  end
end

if status is-interactive
  # Common config
  __source_required ~/.config/fish/config/common/env.fish
  __source_required ~/.config/fish/config/common/prompt.fish
  __source_required ~/.config/fish/config/common/system.fish
  __source_required ~/.config/fish/config/common/aliases.fish

  # NOTE: aliases are sourced after common config so they have access to any
  # environment variables set in the env.fish or system.fish files.

  # OS-specific config
  switch (uname)
  case Linux
      if check_wsl then
    __source_required ~/.config/fish/config/wsl/env.fish
    __source_required ~/.config/fish/config/wsl/system.fish
    __source_required ~/.config/fish/config/wsl/aliases.fish
      else
          __source_required ~/.config/fish/config/linux/aliases.fish
    __source_required ~/.config/fish/config/linux/env.fish
    __source_required ~/.config/fish/config/linux/system.fish
      end
  case Darwin
      __source_required ~/.config/fish/config/mac/completions.fish
      __source_required ~/.config/fish/config/mac/env.fish
      __source_required ~/.config/fish/config/mac/system.fish
      __source_required ~/.config/fish/config/mac/aliases.fish
  case '*'
      echo `Do not know about (uname)`
  end
end

functions -e __source_required

# Exit non-zero if any expected config file was missing.
test $__config_load_failed -eq 0
