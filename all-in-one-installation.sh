#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install some util
declare -a cask_arr=("iterm2" "visual-studio-code" "insomnia" "slack" "docker" "google-chrome" "firefox" "openvpn-connect" "mongodb-compass")
for i in "${cask_arr[@]}"
do
    echo "installing $i..."
    brew install --cask $i
done

declare -a command_arr=("fzf" "the_silver_searcher" "go" "node")
for i in "${command_arr[@]}"
do
    echo "install $i..."
    brew install $i
done

# move .gitconfig
mv .gitconfig ~/.gitconfig

# install oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Please set theme and plugin"
echo "1. open ~/.zshrc"
echo "2. set ZSH_THEME=powerlevel10k/powerlevel10k"
echo "3. set plugins=(other plugins... zsh-autosuggestions zsh-syntax-highlighting)"

# reload shell
source ~/.zshrc
