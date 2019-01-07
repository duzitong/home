#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# color definition
ORE='\[\e[0m\]'
YELLOW='\[\e[1;33m\]'
GRENN='\[\e[1;32m\]'
BLUE='\[\e[1;34m\]'

PS1='\n'$YELLOW'[\u '$GRENN'\H '$BLUE'\w'$ORE'\[\e[1;33m\]]\n\$> \[\e[0m\]'
#\[\e[34m\]
#\[\e[m\]


alias ..='cd ..'
# confirm before any rm operation
alias rm='rm -i'

# shortcut alias
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -al --color=auto'
alias grep='grep --color'
alias sd='sudo'
alias sc='sudo systemctl'
alias pm='sudo pacman'
alias n='sudo netctl'
alias na='sudo netctl-auto'
alias y='yaourt'

#editor
export EDITOR="vim"

# including this ensures that new gnome-terminal tabs keep the parent `pwd` !
if [ -e /etc/profile.d/vte.sh ]; then
    . /etc/profile.d/vte.sh
fi
