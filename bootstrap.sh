#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

read -p "This will overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
				--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;

	source ~/.bash_profile;
fi;

read -p "Would you like to change your OSX configuration? (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
	source ~/.osx
fi;
