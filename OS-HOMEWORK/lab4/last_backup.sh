#!/bin/bash
str=$HOME/Backup-
len=${#str}
find $HOME -maxdepth 1 -regextype posix-extended -regex "$HOME/Backup-[0-9]{4}-[0-9]{2}-[    0-9]{2}"  -type d | sort -r  |
while read line; do
    date=${line:$len}
    if date "+%d-%m-%Y" -d $date 1>/dev/null 2>/dev/null; then
       echo Backup-$date
       break
    fi
done
