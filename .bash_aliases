#! /bin/bash
#
# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias greppy="grep -nrI --include=\*.py"
alias cl="clear"
alias vim="vim -p"
alias lr="ls -ltr"
alias l="ls -l"
alias ll="ls -la"

# my aliases
alias l='ls -l'
alias ll='ls -la'
alias lr='ls -ltr'
alias cl='clear'
alias dockersudo='sudo usermod  -aG docker iria && newgrp docker'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
alias diff="diff --color -y"
# diff --color -y <(fold -s -w 20 preds_ankaa_beam.txt) <(fold -s -w 20 preds_v19_beam.txt)
# functions

sidediff () {
diff --color -y <(fold -s -w 20 $1) <(fold -s -w 20 $2)
}
