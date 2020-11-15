#! /bin/sh

backup_dirs="/home/mukul/.config/compton\
 /home/mukul/.config/dunst\
 /home/mukul/.config/pcmanfm\
 /home/mukul/.config/i3\
 /home/mukul/.config/mpv\
 /home/mukul/.config/qt5ct\
 /home/mukul/.config/rofi\
 /home/mukul/.config/termite\
 /home/mukul/.config/viper4linux\
 /home/mukul/scripts\
 /home/mukul/Blender_Projects"

target_dir=/home/mukul/Backup

notify-send "Backing up directories"

echo "$backup_dirs" | tr ' ' '\n' | while read dir; do
	if [ ! -d "$dir" ]; then
		notify-send -u critical "$dir directory does not exist!"
	else
		rsync -a --delete $dir $target_dir
	fi
done

notify-send "Backup done"
