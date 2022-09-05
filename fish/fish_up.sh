#!/bin/bash

echo "Setting up fish..."
mkdir -p $HOME/.config/fish

cp -r $PWD/config/* $HOME/.config/fish
cp -r $PWD/functions $HOME/.config/fish

echo "Setting up fisher..."
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install pure-fish/pure
