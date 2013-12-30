#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

readonly xresource=$HOME/.Xresources
[[ -e $xresource ]] && xrdb -merge $xresource

compton --config $HOME/.compton.conf &
startxfce4
