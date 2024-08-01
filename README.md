
# dotfiles

This is the repo with my dotfiles.

They are meant to be used on a linux machine, and are configured
for my personal use while coding in python mostly.

Still a WIP, as I haven't tested on other machines yet, and haven't finished documentation & installation scripts.

### prerequisites
- vim >= 9.0 for copilot


### configuration files for current version
- [x] vimrc
- [x] tmux.conf
- [x] bash_aliases
- [ ] bashrc
- [ ] vim-plug
- [ ] xclip
- [x] gitconfig
- [ ] installation script
- [ ] versioning
- [ ] env
- [ ] zsh (?)


### installation

use symlinks to link the files to the home directory

```bash
ln -s /path/to/dotfiles/.vimrc ~/.vimrc
```

#### Manual installation of dependencies

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

### TODO list with missing/broken functionality
- vimr
  - vim-plug documentation
  - version install
  - xclip compiling
  - ctags (?)
  - vim-wiki or other note taking plugin
- tmux.conf
- bashrc with PS1 w/ git_parse
- prerequisites


