#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

if [[ $# -ne 1 ]]; then
   echo "Pass image path as the first argument"
   exit 1
fi

cp "$1" /home/mukul/Pictures/wallpaper.jpg
cp "$1" /usr/share/pixmaps/wallpaper.jpg
