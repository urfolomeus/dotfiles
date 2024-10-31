if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Common config
source ~/.config/fish/config/common/aliases.fish
source ~/.config/fish/config/common/env.fish
source ~/.config/fish/config/common/prompt.fish
source ~/.config/fish/config/common/system.fish

# OS-specific config
switch (uname)
case Linux
    source ~/.config/fish/config/linux/aliases.fish
    source ~/.config/fish/config/linux/env.fish
    source ~/.config/fish/config/linux/system.fish
case Darwin
    source ~/.config/fish/config/mac/aliases.fish
    source ~/.config/fish/config/mac/env.fish
    source ~/.config/fish/config/mac/system.fish
case '*'
    echo `Do not know about (uname)`
end
