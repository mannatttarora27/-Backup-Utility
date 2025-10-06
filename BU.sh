#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Usage: $0 <source_directory> <backup_directory>"
    exit 1
fi

SOURCE=$1
DEST=$2

if test ! -e "$SOURCE"
then
    echo "Error: Source directory does not exist!"
    exit 1
fi

if test ! -e "$DEST"
then
    echo "Error: Destination directory does not exist!"
    exit 1
fi

TIMESTAMP=$(date +"%d-%m-%Y")

DIR_NAME=$(basename "$SOURCE")

BACKUP_PATH="$DEST/${DIR_NAME}-${TIMESTAMP}"

cp -r "$SOURCE" "$BACKUP_PATH"

if [ $? -eq 0 ]
then
    echo "Backup created successfully at: $BACKUP_PATH"
else
    echo " Backup failed!"
fi
