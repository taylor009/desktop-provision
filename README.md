# Workstation Setup Script

This repository contains a bash script for setting up a new workstation. It automates the process of installing and configuring various tools and packages.

## What does the script do?

1. Sets the current user as a sudoer without requiring a password.
2. Updates the system packages.
3. Installs essential tools: vim, git, curl, wget.
4. Installs and configures Zsh with oh-my-zsh and the Powerlevel10k theme.
5. Downloads and installs the Meslo Nerd Font patched for Powerlevel10k.
6. Installs and configures zsh-syntax-highlighting and zsh-autosuggestions plugins.
7. Installs and enables autojump.
8. Installs nvm and the latest LTS version of Node.js.
9. Installs sdkman and the latest version of Gradle.

## How to use the script

To use the script, clone the repository and run the `init.sh` script:

```shellscript
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
chmod +x init.sh
./init.sh