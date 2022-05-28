#!/bin/bash
if  nmcli | grep -q 'connected'; then
  echo "直"
  eww update wifi-icon="直"
else
  echo "睊"
  eww update wifi-icon="睊"
fi
