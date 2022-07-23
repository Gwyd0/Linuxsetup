#!/bin/bash
if dunstctl is-paused| grep 'false'; then 
  eww update noti-icon="ﮗ"
  dunstctl set-paused true
else
  eww update noti-icon="ﮖ"
  dunstctl set-paused false
  notify-send "Notifications" "Do Not Distrub Disabled"
fi
