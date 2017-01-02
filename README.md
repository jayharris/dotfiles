# dotfiles (jayharris)

## Installation

**Warning:** These are my preferred settings. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository; the bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/jayharris/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh [--force]
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/jayharris/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

## Feedback

Suggestions/improvements are
[welcome and encouraged](https://github.com/jayharris/dotfiles/issues)!

## Author

| [![twitter/jayharris](http://gravatar.com/avatar/1318668b99b2d5a3900f3f7758763a69?s=70)](http://twitter.com/jayharris "Follow @jayharris on Twitter") |
|---|
| [Jay Harris](http://twitter.com/jayharris/) |

## Thanks to…

* [dotfiles](http://mths.be/dotfiles) repository by [Mathias Bynens](http://mathiasbynens.be/)
