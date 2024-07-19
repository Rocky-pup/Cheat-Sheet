#!/bin/bash

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

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
npm i -g yarn typescript tsx pm2 npm@latest
