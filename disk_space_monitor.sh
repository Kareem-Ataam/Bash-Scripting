#!/bin/bash
##################
##This script checks the avilable disk space on a filesystem you specify and if it's below a threshold (you specify) 
##it will give an alert
##Positional paramters: It takes two parameters 1->the file system 2->threshold(MB) 
##Example running the script: ./disk_space_monitor.sh /dev/sda1 512
##################

FILESYSTEM=$1
THRESHOLD=$2  #In Megabytes

#Available space on the file system
AVAILABLE_SPACE=$(df -BM $FILESYSTEM |awk 'NR==2 {print $4}'| tr -d M)

#Check if the avialbe space is less then threshold
if [ "$AVAILABLE_SPACE" -lt "$THRESHOLD" ]; then
	#Give an alert
	echo "Alert!!!! The avialable disk space on the filesystem $FILESYSTEM is less than threshold. Available space: $AVAILABLE_SPACE MB" >&2
else
	echo "Disk space on $FILESYSTEM is sufficient. Available space: $AVAILABLE_SPACE MB"
fi

