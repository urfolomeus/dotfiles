#!/bin/bash

echo "\n\nBringing up machine..."
echo "Current working directory: $PWD\n\n"


# asdf
echo "Setting up asdf..."
ln -s $PWD/asdf/.asdfrc $HOME/.asdfrc


# fish
cd $PWD/fish
source fish_up.sh
cd ..


# git
echo "Setting up git..."
ln -s $PWD/git/.gitignore $HOME/.gitignore


# ruby
echo "Setting up gemrc..."
ln -s $PWD/ruby/.gemrc $HOME/.gemrc


# tmux
echo "Setting up tmux..."
ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf


echo "Setup complete."
