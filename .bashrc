# .bashrc


## FEDORA DEFAULT STUFF
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

## MY OWN SETTINGS
# shell
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ {\1}/'
}
PS1="\[\e[1;32m\](\w)\[\e[91m\$(parse_git_branch)\] \[\e[00m\]\[\e[1m\]> \[\e[00m\]"
# PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
# PS1='$(basename "$PWD" |head -c1)\$ '
# PS1='\[\e[1m\][\u@\h \W]\$ ' #bash default

# Auto Completion Case Insensitivew
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

# Some other aliases
alias cls='clear'
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

