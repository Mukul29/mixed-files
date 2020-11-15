#! /bin/sh

string="$(xtitle)"
if [[ $string == "" ]]
then
	string+="Press Windows+d to launch an application"
fi
echo $string
