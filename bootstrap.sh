#!/usr/bin/env sh

if xcode-select --print-path &>/dev/null; then
    echo "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    echo "Finished installing XCode command line tools."
else
    echo "Failed to install XCode command line tools."
fi

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

touch ~/.hushlogin;

brew install zsh;

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

curl -L http://install.ohmyz.sh | sh;

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh

rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    -avh --no-perms . ~;

source ~/.zshrc;