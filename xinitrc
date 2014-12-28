#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

readonly xresource=$HOME/.Xresources
[[ -e $xresource ]] && xrdb -merge $xresource

[[ -z $(command -v compton >/dev/null 2>&1) ]] && compton --config $HOME/.compton.conf &
exec i3 -V >> ~/.i3/i3log 2>&1
