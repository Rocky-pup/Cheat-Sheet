#!/bin/bash

# Update packages cache
sudo apt-get update -y

# Upgrade packages
sudo apt-get upgrade -y

# Install things
sudo apt-get install git nano curl -y

#Ask github mail for github to display my avatar on commits
read -p 'Github mail: ' mail

#Set github email for git
git config --global user.email $mail

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$(curl --silent "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')/install.sh | bash

# Export NVM_DIR environment variable
export NVM_DIR="$HOME/.nvm"

# Load nvm
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi

# Load nvm bash_completion
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi

# Install Node.js v20 using nvm
nvm install v20

# Install global npm packages
npm i -g yarn typescript tsx pm2 npm@latest npm-check-updates

# Restart terminal
sudo reboot