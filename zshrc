###################################################################
#
# The following sources were of great help in writing this
#
# - https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
# - https://wiki.archlinux.org/index.php/Zsh
#
###################################################################

if [ -r $HOME/.zprofile ];then
	source $HOME/.zprofile
fi

autoload -Uz colors && colors

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history share_history
setopt beep extendedglob

export EDITOR=vim

autoload -U compinit && compinit
zstyle ':completion:*' menu select
setopt completealiases


autoload -U promptinit && promptinit
PROMPT="%{$fg_no_bold[yellow]%}[%?]%{$reset_color%}%{$fg[red]%}%B%~ %{$reset_color%}%# %b"
RPROMPT="%{$fg[green]%}%n@%M%{$reset_color%}"

alias e='vim'
#GREP
alias grep='grep -n --color=auto' #color in grep

#LS
alias ls='ls --color=auto -aF'	#color in ls, classify, include hidden
alias ll='ls -lhrt'	#show details in human readable format,sort(desc by time)
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
