#!/bin/sh
echo "Backup Started...."
rsync -ahv  ~/.thunderbird/ ~/important-data/mailbackup/
echo "Backup Completed!"

