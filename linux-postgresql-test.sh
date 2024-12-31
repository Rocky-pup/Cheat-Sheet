#!/bin/bash

# Update package cache
sudo apt-get update -y

# Upgrade installed packages
sudo apt-get upgrade -y

# Install necessary prerequisites
sudo apt-get install -y wget gnupg2 software-properties-common

# Import PostgreSQL signing key
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Add PostgreSQL repository
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# Update package cache again
sudo apt-get update -y

# Install the latest PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Start and enable PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Set up user, database, and password
sudo -u postgres psql <<EOF
-- Create a new user
CREATE USER test WITH LOGIN SUPERUSER PASSWORD 'test';

-- Create a new database
CREATE DATABASE test OWNER test;
EOF

# Display completion message
echo "PostgreSQL installation and setup complete."
echo "Database: test"
echo "User: test"
echo "Password: test"
