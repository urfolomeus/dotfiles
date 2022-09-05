#!/bin/bash

echo "Setting up fish..."
mkdir -p $HOME/.config/fish

ln -s $PWD/config/config.fish $HOME/.config/fish/config.fish
ln -s $PWD/config/aliases.fish $HOME/.config/fish/aliases.fish
ln -s $PWD/config/linux $HOME/.config/fish/linux
ln -s $PWD/config/mac $HOME/.config/fish/mac

echo "Setting up fisher..."
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install pure-fish/pure

ln -s $PWD/functions/mcd.fish $HOME/.config/fish/functions/mcd.fish
