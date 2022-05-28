#!/bin/bash
if  playerctl status | grep -q 'Playing'; then
  playerctl pause
  eww update play-icon=""
else
  playerctl --player=%any play
  eww update play-icon=""
fi
