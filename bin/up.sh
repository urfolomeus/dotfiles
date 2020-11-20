#!/bin/bash

echo "\n\nBringing up machine..."
echo "Current working directory: $PWD\n\n"


# git

echo "Setting up git..."

ln -s $PWD/git/.gitignore $HOME/.gitignore
ln -s $PWD/../private/git/gitconfig $HOME/.gitconfig


# zsh

echo "Setting up zsh..."

ln -s $PWD/zinit/.zshrc $HOME/.zshrc
