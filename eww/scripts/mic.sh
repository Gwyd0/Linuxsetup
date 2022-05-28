#!/bin/bash
if  amixer -D pulse sget Capture | grep 'off'; then
  eww update mic-icon=""
else
  eww update mic-icon=""
fi
