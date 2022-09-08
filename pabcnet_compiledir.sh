#!/bin/bash
for directory in $(ls $1)
do
	if [ -d $1/$directory ]
	then
		for file in $(ls $1/$directory)
		do
			if [ -d $1/$directory/$file ]
			then
				for truefile in $(ls $1/$directory/$file | grep -e "*.pas")
				do
					pabcnetc "$1/$directory/$file/$truefile" >> $2/$directory.txt
					printf "\nFile $1/$directory/$file/$truefile\nExit code $? \n\n" >> $2/$directory.txt
				done
			else
			echo $file | grep -e ".pas"
			if [ "$?" = "0" ]
				then
				pabcnetc "$1/$directory/$file" >> $2/$directory.txt
				printf "\nFile $1$directory$file\nExit code $? \n\n" >> $2/$directory.txt
				fi
			fi
		done
	elif [ -f $1/$directory ]
	then
	echo $directory | grep -e ".pas"
		if [ "$?" = "0" ]
			then
			pabcnetc "$1/$directory" >> $2/$directory.txt
			printf "\nFile $1$directory\nExit code $? \n\n" >> $2/$directory.txt
		fi
	fi
done