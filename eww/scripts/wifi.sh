#!/bin/bash

if [[ "$1" == "--updateicon" ]]; then
  if  nmcli | grep -q 'connected'; then
    echo "直"
  else
    echo "睊"
  fi
elif [[ "$1" == "--updatetext" ]]; then
  if  nmcli | grep -q 'connected'; then
    echo "Connected"
  else
    echo "Not Connected"
  fi
elif [[ "$1" == "--button" ]]; then
  if  nmcli | grep -q 'connected'; then
    eww update wifi-icon="睊"
    eww update wifi-text="Disconnected"
    nmcli radio wifi off
  else
    eww update wifi-icon="直"
    eww update wifi-text="Connected"
    nmcli radio wifi on
  fi
fi
