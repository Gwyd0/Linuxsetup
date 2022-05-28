#!/bin/bash
if  amixer -D pulse sget Master | grep 'off'; then
  eww update sound-icon="婢"
else
  eww update sound-icon="墳"
fi

























