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
  switch (uname)
  case Linux
      if check_wsl then
          __source_required ~/.config/fish/config/wsl/config.fish
      else
          __source_required ~/.config/fish/config/linux/config.fish
      end
  case Darwin
      __source_required ~/.config/fish/config/mac/config.fish
  case '*'
      echo `Do not know about (uname)`
  end
end

functions -e __source_required

# Exit non-zero if any expected config file was missing.
test $__config_load_failed -eq 0
