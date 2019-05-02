#!/usr/bin/env bash

set -eux

dotfiles=(.config/fish .config/iterm2 .gitignore .gitconfig)

for dotfile in ${dotfiles[@]}
do
    ln -s $PWD/$dotfile ~/$dotfile
done
