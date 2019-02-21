#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS";
	then
		eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

DEFAULTSESSION=awesome

case "$1" in
	awesome) exec awesome ;;
	*)exec $DEFAULTSESSION ;;
esac
