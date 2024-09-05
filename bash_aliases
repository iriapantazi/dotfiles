#! /bin/bash
#
# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias greppy="grep -nrI --include=\*.py"
alias cl="clear"
alias cp="cp -iv"
alias vim="vim -p"
alias lr="ls -ltr"
alias l="ls -l"
alias ll="ls -la"

# tmux
alias tmux="tmux -2"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tnew="tmux new -s"
alias tkill="tmux kill-session -t"

# my aliases
alias l='ls -l'
alias ll='ls -la'
alias lr='ls -ltr'
alias cl='clear'
alias dockersudo='sudo usermod  -aG docker iria && newgrp docker'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias diff="diff --color -y"
alias cpv='rsync -ah --info=progress2' # copy with progress bar

# functions
# sidediff
sidediff () {
diff --color -y <(fold -s -w ${3:-20} $1) <(fold -s -w ${3:-20} $2)
}
# wn
wnv () {
watch -n ${1:-1} nvidia-smi
}


