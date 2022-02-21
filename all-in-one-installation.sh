#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

# set theme
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# reload shell
source ~/.zshrc
