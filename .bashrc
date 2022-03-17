# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
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

alias tgz="tar -xzvf"
alias ls="ls -lh --color"
# alias fuck="sudo $(history -p !!)"
alias ytdl-best="yt-dlp -f bestvideo+bestaudio"
alias ytdl="yt-dlp"

md () {
	mkdir -p $1
	cd $1
}

# Command to extract files
extract () {
	if [ -f "$1" ] ; then
		case "$1" in
       		*.tar.bz2)   tar xvjf "$1"		;;
			*.tar.gz)    tar xvzf "$1"    	;;
			*.bz2)       bunzip2 "$1"     	;;
			*.rar)       unrar x "$1"     	;;
			*.gz)        gunzip "$1"      	;;
			*.tar)       tar xvf "$1"     	;;
			*.tbz2)      tar xvjf "$1"    	;;
			*.tgz)       tar xvzf "$1"    	;;
			*.zip)       unzip "$1"       	;;
			*.Z)         uncompress "$1"  	;;
			*.7z)        7z x "$1"        	;;
			*)           echo "I don't know how to extract $1..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Scan all connected devices on router (Only works with routers with the same mask as home)
alias lanscan="sudo nmap -sn 192.168.1.*"

# Play just about anything web related that youtube-dl (yt-dlp) supports
function webplay () {
	ffplay -vf scale=720x480 "$(yt-dlp -g $1)";
}

function int-speed () {
	curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -;
}

# Start powerline Bash prompt
if [ -f `which powerline-daemon` ];
then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/share/powerline/bash/powerline.sh
fi
