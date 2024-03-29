if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/aliases.fish
source ~/.config/fish/env.fish

switch (uname)
case Linux
    source ~/.config/fish/linux/env.fish
    source ~/.config/fish/linux/system.fish
case Darwin
    source ~/.config/fish/mac/env.fish
    source ~/.config/fish/mac/system.fish
case '*'
    echo `Do not know about (uname)`
end
