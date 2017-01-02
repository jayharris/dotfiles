# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
# `**/qux` will enter `./foo/bar/baz/qux`
shopt -s autocd
# * Recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar

# Add tab completion for many Bash commands; requires `brew install homebrew/versions/bash-completion2`
# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# Gulp Bash Completion
if [[ -n $(command -v gulp) ]]; then
  eval "$(gulp --completion=bash)"
fi

# RVM
if [[ -s ~/.rvm/scripts/rvm ]]; then
  . ~/.rvm/scripts/rvm
  # RVM bash completion
  [[ -r ~/.rvm/scripts/completion ]] && . ~/.rvm/scripts/completion
fi

# NVM
if [[ -s ~/.nvm/nvm.sh ]]; then
  . ~/.nvm/nvm.sh
fi
