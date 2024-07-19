---
[]: # Title: dotfiles
[]: # Date: 2021-07-25
[]: # Tags: dotfiles, vim, tmux, bash, git
[]: # Description: This is the start of the repo for my dotfiles. I will be adding more as I go along.
---

# dotfiles
This is the start of the repo for my dotfiles. I will be adding more as I go along.


### configuration files for current version
- [x] vimrc
- [x] tmux.conf
- [x] bash_aliases
- [ ] bashrc
- [x] gitconfig
- [ ] install script
- [ ] versioning


### installation
use symlinks to link the files to the home directory
```bash
ln -s /path/to/dotfiles/.vimrc ~/.vimrc
```

### TODO list with missing/broken functionality
- vimr
  - vim-plug documentation
  - version install
  - xclip compiling
  - vim-wiki or other note taking plugin
- tmux.conf
  - copy
- bashrc with PS1 w/ git_parse
