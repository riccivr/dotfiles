#!/bin/bash
# sets the volume decrementally, checks if spotify is running first
ps cax | grep 'spotify$' > /dev/null
if [ $? -eq 0 ]; then
	xdotool key --window $(xdotool search --name "Spotify (Free |Premium |Unlimited )?- Linux Preview"|head -n1) "ctrl+Down"
else
	CURRENTVOLUME="$(playerctl volume)"
	VOLUMEDECREASE=0.05
	NEWVOLUME="$(echo $CURRENTVOLUME - $VOLUMEDECREASE | bc)"
	playerctl volume "$NEWVOLUME"
fi