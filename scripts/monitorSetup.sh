#! /bin/bash

if [[ $# -lt 3 ]]; then
	echo "Usage: $0 <WIDTH> <HEIGHT> <OUTPUT_DEVICE>"
	exit 1
fi
WIDTH=$1
HEIGHT=$2
DISP=$3
MODE_NAME="${1}x${2}_60.00"
echo $MODE_NAME

xrandr --output $DISP --off
xrandr --delmode $DISP $MODE_NAME > /dev/null 2>&1
xrandr --rmmode $MODE_NAME > /dev/null 2>&1
# xrandr --newmode $MODE_NAME 106.50 1440 1528 1672 1904 900 903 909 934 -hsync +vsync
xrandr --newmode $MODE_NAME $(cvt $WIDTH $HEIGHT | sed -n '2p' | tr -s ' ' | cut -d " " -f3-)
xrandr --addmode $DISP $MODE_NAME
xrandr --output $DISP --mode $MODE_NAME

