#!/bin/bash
if  amixer -D pulse sget Master | grep 'off'; then
  eww update sound-icon="婢"
  notify-send "Speakers" "Sound is now muted." -i "~/.config/dunst/img/sound.png"
else
  eww update sound-icon="墳"
  notify-send "Speakers" "Sound is now unmuted." -i "~/.config/dunst/img/sound.png"
fi

























