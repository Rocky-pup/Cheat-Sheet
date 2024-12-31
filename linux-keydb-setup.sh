#!/bin/bash

# Update package cache
sudo apt-get update -y

# Upgrade installed packages
sudo apt-get upgrade -y

# Install necessary prerequisites
sudo apt-get install -y software-properties-common wget gnupg2

# Add KeyDB repository
sudo add-apt-repository ppa:andreasschmidt/keydb-stable -y

# Update package cache again
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
