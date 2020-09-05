#!bin/bash

#myBaCkup0: backup utility for dev directory 
#Created during Coursera Introduction to Bash Course

BACKUP_PATH="/home/rhyme/dev/"
HOME_PATH="/home/rhyme"

DATE=`date +%d%m%Y`

BACKUP="backup_"
EXT=".tar"

FILE_NAME=$HOME_PATH$BACKUP$DATE$EXT

echo $FILENAME

# Create a file with file name and use the backup path
tar cf $FILE_NAME $BACKUP|PATH

# Compress the tar file
gzip $FILE_NAME

# or use tar cf -z $FILE_NAME $BACKUP|PATH

# Send backup to desired email if it is created
if test -f "$FILE_NAME"; then
 echo "Here is your daily backup@" | mail -A $FILE_NAME -s "Today's Backup" test@test.com
else $DATE "There was a problem creating the backup file." >> $HOME_PATH/error.log
fi