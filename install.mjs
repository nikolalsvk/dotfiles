#!/usr/bin/env zx

console.log(chalk.blue("Checking if vim-plug exists..."));
if (fs.exists(`${os.homedir()}/.vim/autoload/plug.vim`)) {
  console.log(chalk.green("You already have vim-plug, awesome!"));
} else {
  console.log(chalk.red("Nope, installing vim-plug"));

  await $`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`;
}

console.log(chalk.blue("Checking if rg exists..."));
try {
  await $`which rg`;
} catch {
  console.log(chalk.red("Nope, installing rg (rigrep)"));

  await $`brew install ripgrep`;
}

console.log(chalk.blue("Checking if zsh is installed"));

try {
  await $`which zsh`;
  console.log(chalk.green("You already have zsh, awesome!"));
} catch (p) {
  console.log(chalk.red("Nope, installing zsh and oh-my-zsh"));

  await $`brew install zsh`;
  await $`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`;
}

console.log(chalk.blue("Checking if honukai theme is installed"));
if (fs.exists("~/.oh-my-zsh/themes/honukai.zsh-theme")) {
  console.log(chalk.green("You already have honukai theme, awesome!"));
} else {
  console.log(chalk.red("Nope, installing honukai theme"));
  await $`wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"`;
}

console.log(chalk.blue("Copying .vimrc to ~/.vimrc"));
await nothrow($`cp -i .vimrc ~/.vimrc`);

console.log(chalk.blue("Copying .gitconfig to ~/.gitconfig"));
await nothrow($`cp -i .gitconfig ~/.gitconfig`);

console.log(chalk.blue("Copying .zsh-aliases to ~/.zsh-aliases"));
await nothrow($`cp -i .zsh-aliases ~/.zsh-aliases`);

fs.readFile(`${os.homedir()}/.zshrc`, async (err, data) => {
  if (err) throw err;
  if (data.includes("zsh-aliases")) {
    console.log(
      chalk.green("~/.zshrc contains .zsh-alises so I'm not adding it")
    );
  } else {
    console.log(chalk.red("Adding .zsh-aliases to ~/.zshrc"));
    await $`echo "source ~/.zsh-aliases" >> ~/.zshrc`;
  }
});
