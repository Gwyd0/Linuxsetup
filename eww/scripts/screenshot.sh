#!/bin/bash
# this script is for ubuntu not arch.
eww close dashboard
eww close sidebar
gnome-screenshot -d 1 -a
notify-send "Screenshot Taken" "Saved to ~/Pictures"
