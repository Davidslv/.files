#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

read -p "This will overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # exclude .osx for non OSX systems
  if [[ $OSTYPE == darwin* ]] ; then
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
          --exclude "*.swp" --exclude "README.md" --exclude "LICENSE" \
          -avh --no-perms . ~;

  else
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
          --exclude "*.swp" --exclude "README.md" --exclude "LICENSE" \
          --exclude ".osx" -avh --no-perms . ~;
  fi

	source ~/.bash_profile;
fi;

echo ""
if [[ $OSTYPE == darwin* ]] ; then
  read -p "Would you like to change your OSX configuration? (y/n) " -n 1;
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    source ~/.osx
  fi;
fi;
