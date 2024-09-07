
# dotfiles

This is the repo with my dotfiles.

They are meant to be used on a linux machine, and are configured
for my personal use while coding in python mostly.

Still a WIP, as I haven't tested on other machines yet, and haven't finished documentation & installation scripts.

### prerequisites
- vim >= 9.0 for copilot
- ripgrep (sudo apt-get install ripgrep)


### configuration files for current version
- [x] vimrc
- [x] tmux.conf
- [x] bash_aliases
- [x] gitconfig
- [x] installation script
- [ ] bashrc profile
- [ ] vim-plug
- [ ] xclip
- [ ] versioning
- [ ] env
- [ ] zsh (?)


### installation

use symlinks to link the files to the home directory

```bash
ln -s /path/to/dotfiles/.vimrc ~/.vimrc
```
or run the script to install all the files (you will be asked which ones will be installed)

```bash
./install.sh
```

### Manual installation of dependencies

##### python3.xx
TODO


##### virtualenvwrapper
```bash
pip3 install virtualenvwrapper
```
add in .bashrc
```bash
export WORKON_HOME=$HOME/.virtualenvs
export PATH=$PATH:$HOME/.local/bin
source $HOME/.local/bin/virtualenvwrapper.sh
```

#### bash
For git-related info append this to your bash profile or .bashrc
```bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[01;32m\]\w\[\033[01;91m\]\$(parse_git_branch)\[\033[01;00m\] $ "
```

### tmux

### vim editor packages &

### compile w/ xclip support

#### vim plug

#### vim fugitive

#### vimwiki

#### language server (ALE)

#### spell checker

