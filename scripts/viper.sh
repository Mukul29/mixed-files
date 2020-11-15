#!/bin/sh
status="$(viper status | grep -o "RUNNING")"

if [ $status = "RUNNING" ]; then
	viper stop
	notify-send -t 3000 "Stopping viper4linux"
else 
	pactl set-sink-mute 0 toggle
	viper start
	notify-send -t 3000 "Starting viper4linux"
	sleep 2
	pactl set-sink-mute 0 toggle
fi
