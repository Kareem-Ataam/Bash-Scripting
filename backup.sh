#!/bin/bash
####################
###This script takes a full or incremental (as the user need) backup of a directory called images in the home directory 
###of the user executing the script
###Positional parameters: type of backup-- either full or incremental
###Running the script:./backup.sh full or ./backup.sh incremental
###################
BACKUP_SOURCE=$HOME/images
BACKUP_DEST=$HOME
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

#Checking the type of the backup that the user passes as input
if [ $1 == "full" ]; then
	BACKUP_TYPE="Full"
elif [ $1 == "incremental" ]; then
	BACKUP_TYPE="Incremental"
else
	echo "Usage: $0 [full | incremental]"
	exit 1
fi

BACKUP_DIRECTORY=$BACKUP_DEST/backup-$BACKUP_TYPE-$TIMESTAMP

#Checking if there is already existing backup
ls -l ${BACKUP_DEST}/backup-* &>/dev/null

#If there is already existing bckup it will be used as the latest backup for the incremental backup otherwise 
#an empty directory which is the destination of the backup will be used as the latest backup
if [ $? -eq 0 ]; then
	LATEST_BACKUP=$BACKUP_DEST/$(ls -l ${BACKUP_DEST}/backup-* |sort -r | head -n 1| awk '{print $9}')
else
	mkdir -p $BACKUP_DEST/backup-$BACKUP_TYPE-$TIMESTAMP
	LATEST_BACKUP=$BACKUP_DIRECTORY
fi


if [ $BACKUP_TYPE == "Full" ]; then
	echo "Creating a full backup"
	rsync -av --delete "$BACKUP_SOURCE" "$BACKUP_DIRECTORY"
else 
	echo "Creating incremental backup"
	rsync -av --delete --link-dest="$LATEST_BACKUP" "$BACKUP_SOURCE" "$BACKUP_DIRECTORY"
fi
echo "Backup completed: $BACKUP_TYPE backup at $BACKUP_DIRECTORY"

