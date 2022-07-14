#bin/bash
location='bude' #change to your city
temp=$(curl wttr.in/$location?format=%t)
echo $temp
