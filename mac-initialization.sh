#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install some util
declare -a cask_arr=("iterm2" "visual-studio-code" "insomnia" "slack" "docker" "google-chrome" "firefox" "openvpn-connect" "mongodb-compass" "dbeaver-community" "boop" "lens")
for i in "${cask_arr[@]}"; do
    echo "installing $i..."
    brew install --cask $i
done

declare -a command_arr=("fzf" "ripgrep" "go", "wget")
for i in "${command_arr[@]}"; do
    echo "install $i..."
    brew install $i
done

# move .gitconfig
mv .gitconfig ~/.gitconfig

# install oh-my-zsh
brew install zsh
brew install starship

# zsh plugin
brew install zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>${ZDOTDIR:-$HOME}/.zshrc
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>${ZDOTDIR:-$HOME}/.zshrc

# pretty ls command
brew install eza
echo -e "\nalias ls='eza --icons -F -H --group-directories-first --git -1'" >>${ZDOTDIR:-$HOME}/.zshrc
echo -e "\nalias ll='ls -alF'" >>${ZDOTDIR:-$HOME}/.zshrc

# reload shell
source ~/.zshrc

# install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc
