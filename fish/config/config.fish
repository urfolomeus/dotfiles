if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/aliases.fish

switch (uname)
case Linux
    source ~/.config/fish/linux/env.fish
    source ~/.config/fish/linux/system.fish
case Darwin
    source ~/.config/fish/osx/env.fish
    source ~/.config/fish/osx/system.fish
case '*'
    echo `Do not know about (uname)`
end
