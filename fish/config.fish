if status is-interactive
  # Common config
  source ~/.config/fish/config/common/aliases.fish
  source ~/.config/fish/config/common/env.fish
  source ~/.config/fish/config/common/prompt.fish
  source ~/.config/fish/config/common/system.fish


  # OS-specific config
  switch (uname)
  case Linux
      if check_wsl then
    source ~/.config/fish/config/wsl/aliases.fish
    source ~/.config/fish/config/wsl/env.fish
    source ~/.config/fish/config/wsl/system.fish
      else
          source ~/.config/fish/config/linux/aliases.fish
    source ~/.config/fish/config/linux/env.fish
    source ~/.config/fish/config/linux/system.fish
      end
  case Darwin
      source ~/.config/fish/config/mac/aliases.fish
      source ~/.config/fish/config/mac/completions.fish
      source ~/.config/fish/config/mac/env.fish
      source ~/.config/fish/config/mac/system.fish
  case '*'
      echo `Do not know about (uname)`
  end
end

