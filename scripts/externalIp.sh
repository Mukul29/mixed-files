#! /bin/sh

IP=$(curl ifconfig.me/ip)

notify-send "$IP"
echo -n $IP | xclip -selection clipboard

