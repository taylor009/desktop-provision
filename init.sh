#!/usr/bin/bash

# User variable
USER_NAME=$(whoami)

# make user sudoer
echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Install dependencies
sudo apt update
sudo apt dist-upgrade -y

sudo apt install vim
sudo apt install git
sudo apt install curl
sudo apt install wget

# Install zsh
sudo apt install zsh -y

# Make zsh the default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone Powerlevel10k into oh-my-zsh's themes directory
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set ZSH_THEME in .zshrc
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

# Source .zshrc to take changes into effect
source ~/.zshrc

# Download Meslo Nerd Font patched for Powerlevel10k
wget -P $HOME/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P $HOME/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P $HOME/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P $HOME/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Rebuild the font cache
fc-cache -fv

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add plugins to .zshrc
echo 'plugins=(git autojump zsh-syntax-highlighting zsh-autosuggestions)' >> ~/.zshrc

# Source .zshrc to take changes into effect
source ~/.zshrc

# Enable autojump
echo '[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh' >> ~/.zshrc

# Source .zshrc to take changes into effect
source ~/.zshrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Source .zshrc to take changes into effect
source ~/.zshrc

# Install the latest LTS version of Node.js
nvm install --lts

# Install sdkman
curl -s "https://get.sdkman.io" | bash

# Source .zshrc to take changes into effect
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install the latest version of Gradle
sdk install gradle
