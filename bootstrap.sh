#!/usr/bin/env sh

dotfiles=$HOME/Documents/dotfiles

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if xcode-select --print-path &>/dev/null; then
    echo "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    echo "Finished installing XCode command line tools."
fi

if [ -d "$dotfiles" ]; then
    git clone https://github.com/ratzo/dotfiles.git $dotfiles
fi

cd $dotfiles

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update;

# Upgrade any already-installed formulae
brew upgrade;

# Badassify your terminal
# http://jilles.me/badassify-your-terminal-and-shell/

brew cask install iterm2
cp com.googlecode.iterm2.plist $HOME/Library/Application\ Support

brew install zsh;

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

curl -L http://install.ohmyz.sh | sh;

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh

# Install Firacode fonts
mkdir /tmp/firacode

cd /tmp/firacode

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/tonsky/FiraCode/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

curl --silent -L "https://github.com/tonsky/FiraCode/archive/$LATEST_VERSION.zip" --output firacode.zip

bsdtar -xf firacode.zip -s'|[^/]*/||'

rsync distr/otf $HOME/Library/Fonts

cd $OLDPWD

rm -fr /tmp/firacode

brew install tmux

# Sync dot files
rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "sync.sh" \
    --exclude "osx.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    --exclude "com.googlecode.iterm2.plist" \
    -avh --no-perms . ~;

source ~/.zshrc;