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
setopt autocd beep extendedglob

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history share_history

#COMPLETION
autoload -U compinit && compinit
setopt completealiases
zstyle ':completion:*' menu select
#zstyle ':completion:*descriptions' format '%U%B%d%b%u'
zstyle ':completion:*warnings' format '%BSorry; no matches for: %d%b'

#PROMPT
autoload -U promptinit && promptinit
PROMPT="%{$fg_no_bold[yellow]%}[%?]%{$reset_color%}%{$fg[red]%}%B%~ %{$reset_color%}%# %b"
RPROMPT="%{$fg[green]%}%n@%M%{$reset_color%}"

#SET VARIABLES
export PAGER=less
export EDITOR=vim
export LESS_TERMCAP_mb=$(printf "\e[01;31m")
export LESS_TERMCAP_md=$(printf "\e[01;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[01;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[01;32m")

#ALIASES
alias e='vim'
alias m='man'
alias -g ...='cd ../../'
alias -g grep='grep -n --color=auto' #color in grep

#LS
alias -g ls='ls --color=auto -aF'	#color in ls, classify, include hidden
alias -g ll='ls -lhrt'	#show details in human readable format,sort(desc by time)
eval $(dircolors -b)	#evaluate if something is broken

#DISK
alias -g df='df -h'	#human readable
alias -g du='du -c -h'	#grand total, human readable

#SAFETY
alias -g rm='rm -I'
alias -g chown='chown --preserve-root'
alias -g chmod='chmod --preserve-root'
alias -g chgrp='chgrp --preserve-root'
