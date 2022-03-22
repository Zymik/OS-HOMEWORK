#!/bin/bash
short_name="$1"
if [[ "$short_name" =~ .*/.* ]]; then
   echo "Invalid filename"
   exit
fi
exec 3<&0
let size=${#short_name}
cat "$HOME/.trash.log" |
while read -r line;
do
  full_name=$(echo "$line" | awk '{print substr($0,1,length($0)-1-length($NF))}')
  if [[ $(basename "$full_name") == "$short_name" ]]; then
      link_value="$HOME/.trash/$(echo $line | awk '{print $NF}')"
      if [[ ! -f "$link_value" ]]; then
         continue
      fi
      folder_name=${full_name::-$size}
      echo "Do you want to untrash $full_name y/n"
      read -u 3 answer
      while [[ $answer != "y" && $answer != "n" ]];
       do
          echo "Invalid input"
          read -u 3 answer
       done
      #echo $a
      #answer=$a
      if [[ $answer == "y" ]]; then
          if [[ ! -d "$folder_name" ]]; then
             echo "Will restore in root"
             folder_name="$HOME/"
          fi
           while ! ln "$link_value" "$folder_name$short_name" 2>/dev/null; do
               echo "File name is used, enter new"
               read -u 3 short_name
               while [[ "$short_name" =~ .*/.* ]]; do
                  echo "Filename can't include /"
                  read -u 3 short_name
                done
           done
           rm $link_value
      fi
  fi
done
