#!/usr/bin/env sh

# Sync dot files
rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "sync.sh" \
    --exclude "osx.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    --exclude "com.googlecode.iterm2.plist" \
    --exclude "Swiss Arrows" \
    -avh --no-perms . ~;

source ~/.zshrc;