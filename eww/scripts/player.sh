#!/bin/bash
if [[ "$1" == "--player" ]]; then
    if  playerctl -p spotify status -s | grep -q 'Playing'; then
      echo ""
    else
      echo ""
    fi
elif [[ "$1" == "--playerbutton" ]]; then
  if playerctl -l -s | grep -q 'spotify'; then
    if  playerctl -p spotify status | grep -q 'Playing'; then
      playerctl -p spotify pause -s
      eww update play-icon=""
    else
      playerctl -p spotify play -s
      eww update play-icon=""
    fi
  else
    notify-send "Error" "Spotify Not Open." -i  "~/.config/dunst/img/error.png"
  fi
fi
