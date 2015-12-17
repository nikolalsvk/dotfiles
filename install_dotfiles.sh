#!/usr/bin/env bash

echo "Copying `pwd`.vimrc to ~/.vimrc"
cp .vimrc ~/.vimrc
echo "Copying `pwd`.gitconfig to ~/.gitconfig"
cp .gitconfig ~/.gitconfig

git config --global user.email "nikolaseap@gmail.com"
git config --global user.name "nikolalsvk"
