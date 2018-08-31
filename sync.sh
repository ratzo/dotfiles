#!/usr/bin/env sh

# Sync dot files
rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "sync.sh" \
    --exclude "README.md" \
    --exclude "com.googlecode.iterm2.plist" \
    -avh --no-perms . ~;

source ~/.zshrc;