#!/bin/bash
if  eww windows | grep -q '*sidebar'; then
  eww close sidebar
else
  eww open sidebar
fi
