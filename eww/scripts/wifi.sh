#!/bin/bash

if [[ "$1" == "--update" ]]; then # redundent
  wifiname=$(iwgetid -r)
  echo $wifiname
  if  nmcli | grep -q 'connected'; then
    eww update wifi-icon="直"
    eww update wifi-text="Connected"
  else
    eww update wifi-icon="睊"
    eww update wifi-text="Disconnected"
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
