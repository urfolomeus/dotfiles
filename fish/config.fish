if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/config/aliases.fish

switch (uname)
case Linux
    source ~/.config/fish/config/linux/env.fish
    source ~/.config/fish/config/linux/system.fish
case Darwin
    source ~/.config/fish/config/mac/env.fish
    source ~/.config/fish/config/mac/system.fish
case '*'
    echo `Do not know about (uname)`
end
