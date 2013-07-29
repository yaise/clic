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
zstyle ':completion:*' menu select=5
zstyle ':completion:*:default'	list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'	format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options'  auto-description '%d'
zstyle ':completion:*:options'  description 'yes'
#zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

#PROMPT
autoload -U promptinit && promptinit
PROMPT="%{$fg_no_bold[yellow]%}[%?]%{$reset_color%}%{$fg[red]%}%B%~ %{$reset_color%}%# %b"
RPROMPT="%{$fg[green]%}%n@%M%{$reset_color%}"

#SET VARIABLES
export PAGER=less
export EDITOR=vim
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

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
alias rm='rm -I'
alias -g chown='chown --preserve-root'
alias -g chmod='chmod --preserve-root'
alias -g chgrp='chgrp --preserve-root'
