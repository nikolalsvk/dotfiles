#!/usr/bin/env ruby

def print_cyan(text)
  puts "\e[36m#{text}\e[0m"
end

def print_green(text)
  puts "\e[32m#{text}\e[0m"
end

def print_red(text)
  puts "\e[31m#{text}\e[0m"
end

def path(filepath)
  File.expand_path(filepath)
end

print_cyan "Checking if Vundle exists..."
if Dir.exists? path("~/.vim/bundle/Vundle.vim")
  print_green "You already have Vundle, awesome!"
else
  print_red "Nope, installing Vundle"
  `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Nope, installing zsh"
  `sudo apt-get install zsh`
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
else
  print_green "You already have zsh, awesome!"
end

print_cyan "Checking if honukai theme is installed"
if File.exists? path("~/.oh-my-zsh/themes/honukai.zsh-theme")
  print_green "You already have honukai theme, awesome!"
else
  print_red "Nope, installing honukai theme"
  `wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"`
end

print_cyan "Copying #{Dir.home}/.vimrc to ~/.vimrc"
`cp #{Dir.home}/.vimrc ~/.vimrc`
print_cyan "Copying #{Dir.home}/.gitconfig to ~/.gitconfig"
`cp #{Dir.home}/.gitconfig ~/.gitconfig`
