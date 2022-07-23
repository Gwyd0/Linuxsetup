#!/bin/bash
location='bude'

cm1=$(curl wttr.in/$location?format=%t-%c)
IFS="-" read -r temp1 icon1 <<< "$cm1"

cm2=$(curl wttr.in/$location?format=%t-%c)
IFS="-" read -r temp2 icon2 <<< "$cm2"

if [[ "$1" == "--ICON1" ]]; then
    echo $icon1
elif [[ "$1" == "--ICON2" ]]; then
    echo $icon2
elif [[ "$1" == "--TEMP1" ]]; then
    echo $temp1
elif [[ "$1" == "--TEMP2" ]]; then
    echo $temp2
fi
