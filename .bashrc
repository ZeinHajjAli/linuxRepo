# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias :q='exit'
alias :wq='exit'
alias dirs='dirs -v'
alias ls='ls -al --color'
alias fuck='sudo $(history -p !!)'

rtfm () {
	$@ --help 2> /dev/null || man $@ 2> /dev/null || xdg-open "http://www.google.ca/search?q=$@";
}

md () {
	mkdir -p $1
	cd $1
}

if [[ -n $SSH_CONNECTION ]] ; then
	neofetch
fi
