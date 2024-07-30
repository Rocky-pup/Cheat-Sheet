#!/bin/bash

# Update packages cache
sudo apt-get update -y

# Upgrade packages
sudo apt-get upgrade -y

# Install things
sudo apt-get install git nano curl -y

#Install rust
curl -o- https://sh.rustup.rs | bash -s -- -y -q

# Restart terminal
sudo reboot