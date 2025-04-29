#!/bin/bash

# HOW TO USE
# 1. cd to run.sh folder
# 2. run 'source run.sh'

echo -e "\n\n# Nander dotfiles run.sh additions" >> ~/.bashrc

# Copy all files
echo -e "\nCopying files..."
cp system/.alias ~/.alias
cp system/.env ~/.env

cp config/.gitconfig ~/.gitconfig

# Add necessary lines to ~/.bashrc
echo -e "\nAdding lines to ~/.bashrc..."
if ! grep -q ". ~/.alias" ~/.bashrc; then  
    echo ". ~/.alias" >> ~/.bashrc  
fi  
  
if ! grep -q ". ~/.env" ~/.bashrc; then  
    echo ". ~/.env" >> ~/.bashrc  
fi

# Reload ~/.bashrc for this terminal
echo -e "\nReloading ~/.bashrc..."
. ~/.bashrc

echo -e "\nDone!"