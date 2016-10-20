#!/usr/bin/env bash

echo "Checking if Vundle exists..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Nope, installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "You already have Vundle, awesome!"
fi

echo "Checking if zsh is installed"
if [ ! -n "$ZSH_VERSION" ]; then
  echo "Nope, installing zsh"
  sudo apt-get install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copying $DIR/.vimrc to ~/.vimrc"
cp $DIR/.vimrc ~/.vimrc
echo "Copying $DIR/.gitconfig to ~/.gitconfig"
cp $DIR/.gitconfig ~/.gitconfig
