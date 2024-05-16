# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# This .bashrc is intended for general use, you can copy all the file or just the code

test -s ~/.alias && . ~/.alias || true

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1=" \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
# PS1='$(basename "$PWD" |head -c1)\$ '

# Auto Completion Case Insensitivew
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

# Some other custom aliases I prefer to put right here
alias cat='bat --style=plain --paging=never' # In debian derivatives is batcat, in other it's just bat
alias ls='eza --group-directories-first'
alias tree='eza -T'
alias la='eza -la --group-directories-first'
alias l='eza -l'
alias vih='nvim .'
alias svih='sudo nvim .'
alias vi='nvim $1'
alias svi='sudo nvim $1'
alias git-user='git config --global user.name $1'
alias git-mail='git config --global user.email $1'
alias git-creds='git config --global credential.helper $1'
