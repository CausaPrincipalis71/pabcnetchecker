#!/bin/bash
for directory in $(ls $1)
do
	for file in $(ls $1/$directory | grep -v "*.exe")
	do
		if [ -d $1/$directory/$file ]
		then
			for truefile in $(ls $1/$directory/$file | grep -v ".exe"
			do
				pabcnetc "$1/$directory/$file/$truefile" >> $2/$directory.txt
				printf "\nFile $1/$directory/$file/$truefile\nExit code $? \n\n" >> $2/$directory.txt
			done
		else
		pabcnetc "$1/$directory/$file" >> $2/$directory.txt
		printf "\nFile $1$directory$file\nExit code $? \n\n" >> $2/$directory.txt
		fi
	done
done