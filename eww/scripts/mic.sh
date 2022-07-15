#!/bin/bash
if  amixer -D pulse sget Capture | grep 'off'; then
  eww update mic-icon=""
  notify-send "Mic" "You are now muted." -i "~/.config/dunst/img/mic.png"
else
  eww update mic-icon=""
  notify-send "Mic" "You are now unmuted." -i "~/.config/dunst/img/mic.png"
fi
