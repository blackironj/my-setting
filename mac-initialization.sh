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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install starship

# zsh plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins_to_add=("zsh-syntax-highlighting" "zsh-autosuggestions")

# Path to your .zshrc file
zshrc_file="$HOME/.zshrc"

# Loop through each plugin and add it to the .zshrc file
for plugin in "${plugins_to_add[@]}"; do
    # Check if the plugin is already enabled
    if grep -q "plugins=.*$plugin" "$zshrc_file"; then
        echo "Plugin '$plugin' is already enabled."
    else
        # Add the plugin to the plugins list
        sed -i "s/plugins=(/plugins=($plugin /" "$zshrc_file"
        echo "Plugin '$plugin' added."
    fi
done

# pretty ls command
brew install eza
echo -e "\nalias ls='eza --icons'" >>${ZDOTDIR:-$HOME}/.zshrc
echo -e "\nalias ll='ls -alF'" >>${ZDOTDIR:-$HOME}/.zshrc

# set grep to ripgrep
echo -e "\nalias grep=rg"

# install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# reload shell
source "$zshrc_file"
