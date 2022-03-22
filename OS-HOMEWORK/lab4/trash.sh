#!/bin/bash
#echo $1
name=$(realpath "$1")
#echo $name
if [[ ! -f "$name" ]]; then
    echo "Invalid filename"
    exit
fi

if [[ ! -d "$HOME/.trash" ]]; then
   mkdir "$HOME/.trash"
fi

log="$HOME/.trash.log"
if [[ ! -f  $log ]]; then
   counter=0
else
   let  counter=$(cat "$log" | tail -n 1 | awk '{print $NF}')+1
fi
file="$HOME/.trash/$counter"
if  ln "$name" "$file"; then
   echo "$name $counter" >> $log
   rm "$name"
fi

