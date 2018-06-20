#! /bin/zsh

set -e
local timeout=$(xset -q | grep timeout | awk '{print $2}')
if [ $timeout -eq 0 ]
then
	echo $timeout
else
	echo $(expr $timeout / 60)
fi
exit 0
