#!/bin/sh

primary=eDP1
# secondary=DP1
secondary=HDMI1
message="Select monitor: 0 for primary, 1 for secondary, 2 for dual display"

if [ "$#" -lt "1" ]
then
	echo $message
	exit 1
elif [ "$1" -eq  0 ]
then
	xrandr --output $primary --auto
	xrandr --output $secondary --off
	nitrogen --head=0 --set-zoom-fill ~/Pictures/wallpaper.jpg
	nitrogen --head=1 --set-zoom-fill ~/Pictures/wallpaper.jpg
elif [ "$1" -eq 1 ]
then
	xrandr --delmode $secondary "1440x900_60.00"
	xrandr --rmmode "1440x900_60.00"
	xrandr --newmode "1440x900_60.00"  106.50  1440 1520 1672 1904  894 900 927 934 -hsync +vsync
	xrandr --addmode $secondary "1440x900_60.00"
	xrandr --output $secondary --mode "1440x900_60.00"
	xrandr --output $primary --off
	sleep 5
	nitrogen --head=0 --set-zoom-fill ~/Pictures/wallpaper.jpg
	nitrogen --head=1 --set-zoom-fill ~/Pictures/wallpaper.jpg
elif [ "$1" -eq 2 ]
then
	xrandr --output $primary --auto
	xrandr --delmode $secondary "1440x900_60.00"
	xrandr --rmmode "1440x900_60.00"
	xrandr --newmode "1440x900_60.00"  106.50  1440 1520 1672 1904  894 900 927 934 -hsync +vsync
	xrandr --addmode $secondary "1440x900_60.00"
	xrandr --output $secondary --mode "1440x900_60.00" --right-of $primary
	sleep 5
	nitrogen --head=0 --set-zoom-fill ~/Pictures/wallpaper.jpg
	nitrogen --head=1 --set-zoom-fill ~/Pictures/wallpaper.jpg
else
	echo $message
	exit 1
fi
