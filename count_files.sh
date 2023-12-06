#!/bin/bash
#################
####This script counts the number of different file types in a directory that you give its path to the script as a parameter
###Positional parameters:/path/of/directory
###Example running the script:./count_files.sh /dev/
################

PATH_OF_DIRECTORY="$1"

if [ $# -eq 1 ]; then
	NUM_OF_REGULAR_FILES=$(ls -l $PATH_OF_DIRECTORY |grep "^-" -c)
	NUM_OF_DIRECTORIES=$(ls -l $PATH_OF_DIRECTORY |grep "^d" -c)
	NUM_OF_SOFT_LINKS=$(ls -l $PATH_OF_DIRECTORY |grep "^l" -c)
	NUM_OF_BLOCK_FILES=$(ls -l $PATH_OF_DIRECTORY |grep "^b" -c)
	NUM_OF_CHARACTER_FILES=$(ls -l $PATH_OF_DIRECTORY |grep "^c" -c)
	NUM_OF_SOCKET_FILES=$(ls -l $PATH_OF_DIRECTORY |grep "^s" -c)
	
	echo "#################FILES COUNT##################"
	echo "Regular files: $NUM_OF_REGULAR_FILES"
	echo "Directories: $NUM_OF_DIRECTORIES"
	echo "Soft links: $NUM_OF_SOFT_LINKS"
	echo "Block files: $NUM_OF_BLOCK_FILES"
	echo "Character files: $NUM_OF_CHARACTER_FILES"
	echo "Socket files: $NUM_OF_SOCKET_FILES"
	echo "##############################################"
else
	echo "Please pass the directory path while running the script"
fi
