###################################################################
#
# The following sources were of great help in writing this
#
# - https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
# - https://wiki.archlinux.org/index.php/Zsh
#
###################################################################

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history share_history
setopt beep extendedglob

bindkey -v
export EDITOR=vim

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

autoload -Uz promptinit && promptinit
PROMPT="%{$fg[red]%}%B%n@%M %{$reset_color%}%#%b"
autoload -Uz colors && colors

setopt completealiases
###ALIASES####

#GREP
alias grep='grep -n --color=auto' #color in grep

#LS
alias ls='ls --color=auto -F'	#color in ls, classify
alias ll='ls -lhrta'	#show details in human readable format,sort(desc by time),include hidden
eval $(dircolors -b)	#evaluate if something is broken

#DISK
alias df='df -h'	#human readable
alias du='du -c -h'	#grand total, human readable

#SAFETY
alias rm='rm -I'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#MAN
#color man output.
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
} 
