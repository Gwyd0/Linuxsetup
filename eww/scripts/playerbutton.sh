#!/bin/bash
if  playerctl status | grep -q 'Playing'; then
  playerctl -p spotify  pause
  eww update play-icon=""
else
  playerctl -p spotify  play
  eww update play-icon=""
fi
