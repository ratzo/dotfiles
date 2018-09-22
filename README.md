# ratzo's Dotfiles

This is a collection of dotfiles and scripts I use for customizing MacOS to my liking and setting up the software development tools I use on a day-to-day basis.

This script installs and configure Zsh shell based on Jilles Soeters' [Badassify Your Shell](http://jilles.me/badassify-your-terminal-and-shell/) configuration.

- Checks if Xcode command line tools are installed
- Installs Homebrew
- Installs Zsh
- Installs Oh-my-zsh
- Installs Firecode fonts
- Synchronize the dot files into your home directory

## Remote install using curl

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/ratzo/dotfiles/master/bootstrap.sh`"
```

## MacOS Defaults

My favorite part of this repo is the [osx script](https://github.com/ratzo/dotfiles/blob/master/osx.sh) for MacOS.

## License

The code is available under the [MIT license](https://github.com/ratzo/dotfiles/blob/master/LICENSE).