#!/bin/bash
# sets the volume incrementally, check first if spotify is running

ps cax | grep spotify > /dev/null
if [ $? -eq 0 ]; then
	xdotool key --window $(xdotool search --name "Spotify (Free |Premium |Unlimited )?- Linux Preview"|head -n1) "ctrl+Up"
else
	CURRENTVOLUME="$(playerctl volume)"
	VOLUMEINCREASE=0.05
	NEWVOLUME="$(echo $CURRENTVOLUME + $VOLUMEINCREASE | bc)"
	playerctl volume "$NEWVOLUME"
fi