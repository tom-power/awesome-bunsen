#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
run synclient VertEdgeScroll=0 HorizEdgeScroll=0 TapButton1=1 2>/dev/null
run thunar --daemon
run light-locker
run bl-compositor --start
run nm-applet
run pnmixer
run xfce4-power-manager
run bl-conky-session --autostart
run autokey-gtk
run clipit
run keybindings.sh