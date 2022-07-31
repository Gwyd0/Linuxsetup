#!/bin/bash
if [[ "$1" == "--vol" ]]; then
  amixer -D pulse set Master 1+ toggle
  if  amixer -D pulse sget Master | grep 'off'; then
    eww update sound-icon="婢"
    notify-send "Speakers" "Sound is now muted." -i "~/.config/dunst/img/sound.png"
  else
    eww update sound-icon="墳"
    notify-send "Speakers" "Sound is now unmuted." -i "~/.config/dunst/img/sound.png"
  fi
elif [[ "$1" == "--mic" ]]; then
  amixer -D pulse sset Capture +1 toggle
  if  amixer -D pulse sget Capture | grep 'off'; then
    eww update mic-icon=""
    notify-send "Mic" "You are now muted." -i "~/.config/dunst/img/mic.png"
  else
    eww update mic-icon=""
    notify-send "Mic" "You are now unmuted." -i "~/.config/dunst/img/mic.png"
  fi
fi