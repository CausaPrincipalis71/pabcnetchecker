#!/bin/bash

for file in $(ls $1)
do
	cat $1/$file | grep -e "Exit code 1" -B 1
	if [ "$?" = "0" ]
	then
		printf '\n'
		echo $file
		printf '****************\n\n\n'
	fi
done