#!/bin/bash

# Update package cache
sudo apt-get update -y

# Upgrade installed packages
sudo apt-get upgrade -y

# Add the KeyDB repository
echo "deb https://download.keydb.dev/open-source-dist $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/keydb.list

# Add the KeyDB GPG key
sudo wget -O /etc/apt/trusted.gpg.d/keydb.gpg https://download.keydb.dev/open-source-dist/keyring.gpg

# Update package cache again to include KeyDB packages
sudo apt-get update -y

# Install KeyDB
sudo apt-get install -y keydb

# Enable and start the KeyDB service
sudo systemctl enable keydb
sudo systemctl start keydb

# Configure KeyDB with a password
sudo bash -c 'echo "requirepass test" >> /etc/keydb/keydb.conf'

# Restart KeyDB to apply the changes
sudo systemctl restart keydb

# Display completion message
echo "KeyDB installation and setup complete."
echo "Password for KeyDB: test"
