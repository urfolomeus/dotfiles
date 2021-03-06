#!/bin/bash

echo "\n\nBringing up machine..."
echo "Current working directory: $PWD\n\n"


# git

echo "Setting up git..."

ln -s $PWD/git/.gitignore $HOME/.gitignore
ln -s $PWD/../private/git/gitconfig $HOME/.gitconfig


# flake8 (needed for global python linting settings

echo "Setting up python linting..."

ln -s $PWD/python/flake8 $HOME/.config/flake8


# zsh

echo "Setting up zsh..."

ln -s $PWD/zinit/.zshrc $HOME/.zshrc
ln -s $PWD/zinit/.zprofile $HOME/.zprofile
