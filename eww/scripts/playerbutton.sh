#!/bin/bash
if ps aux | grep Spotify | grep -v grep > /dev/null; then
  if  playerctl status | grep -q 'Playing' && ps aux | grep Spotify | grep -v grep > /dev/null; then
    playerctl -p spotify  pause
    eww update play-icon=""
  else
    playerctl -p spotify  play
    eww update play-icon=""
  fi
else
  notify-send "Error" "Spotify Not Open." -i  "~/.config/dunst/img/error.png"
fi
