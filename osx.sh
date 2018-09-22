#!/usr/bin/env sh

# Disable opening iTunes automatically when connecting an iPod/iPhone
defaults write com.apple.iTunes dontAutomaticallySyncIPods -bool true

# iPhone Simulator in full screen
defaults write com.apple.iphonesimulator AllowFullscreenMode -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Show Battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Safari Disable Open "safe" files after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Safari Remove download list items when safari quits
defaults write com.apple.Safari DownloadsClearingPolicy -int 1

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

echo "Done. Note that some of these changes require a logout/restart to take effect."