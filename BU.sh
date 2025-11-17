#!/bin/bash

while true
do
echo "===== Backup Utility ====="
echo "1) Create backup directory"
echo "2) Take backup of folder"
echo "3) View backups"
echo "4) Delete backup"
echo "5) Exit"
echo -n "Enter your choice: "
read ch

case $ch in
1)
echo -n "Enter backup folder name: "
read backup_dir
mkdir -p "$backup_dir"
echo "Backup folder '$backup_dir' created successfully!"
;;
2)
echo -n "Enter source directory to backup: "
read src
if [ -d "$src" ]; then
    timestamp=$(date +"%d-%m-%Y_%H-%M-%S")
    dest="backup-$timestamp"
    mkdir -p "$dest"
    cp -r "$src" "$dest"
    echo "Backup created: $dest"
else
    echo "Directory does not exist!"
fi
;;
3)
echo "Available Backups:"
ls | grep "backup-" 2>/dev/null || echo "No backups found"
;;
4)
echo -n "Enter backup folder name to delete: "
read dname
if [ -d "$dname" ]; then
    rm -r "$dname"
    echo "Backup '$dname' deleted!"
else
    echo "Backup folder does not exist!"
fi
;;
5)
echo "Exiting..."
exit;;
*)
echo "Invalid option!"
;;
esac
done
