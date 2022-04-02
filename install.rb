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

print_cyan "Checking if vim-plug exists..."
if File.exists? path("~/.vim/autoload/plug.vim")
  print_green "You already have vim-plug, awesome!"
else
  print_red "Nope, installing vim-plug"
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
end

print_cyan "Checking if rg exists..."
if `which rg`.include? "not found"
  print_red "Nope, installing rg (ripgrep)"
  `brew install ripgrep`
else
  print_green "You already have rg, awesome!"
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Nope, installing zsh"
  `brew install zsh`
else
  print_green "You already have zsh, awesome!"
end

print_cyan "Checking if oh-my-zsh is installed"
if File.exists? path("~/.oh-my-zsh")
  print_green "You already have oh-my-zsh, awesome!"
else
  print_red "Nope, installing oh-my-zsh"
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
end

print_cyan "Checking if honukai theme is installed"
if File.exists? path("~/.oh-my-zsh/themes/honukai.zsh-theme")
  print_green "You already have honukai theme, awesome!"
else
  print_red "Nope, installing honukai theme"
  `wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"`
end

print_cyan "Copying .vimrc to ~/.vimrc"
`cp -i .vimrc ~/.vimrc`
print_cyan "Copying .gitconfig to ~/.gitconfig"
`cp -i .gitconfig ~/.gitconfig`
print_cyan "Copying .zsh-aliases to ~/.zsh-aliases"
`cp -i .zsh-aliases ~/.zsh-aliases`

if File.readlines(path("~/.zshrc")).grep(/zsh-aliases/).size == 0
  print_cyan "Adding .zsh-aliases to ~/.zshrc"
  `echo "source ~/.zsh-aliases" >> ~/.zshrc`
end
