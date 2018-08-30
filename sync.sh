#!/usr/bin/env sh

# Sync dot files
rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    -avh --no-perms . ~;

source ~/.zshrc;