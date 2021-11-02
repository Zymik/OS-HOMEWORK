#!/bin/bash
acc=1
t="+"
(tail -f pipe) |
while true; do
   read LINE
   case $LINE in
       QUIT)
           echo "NORMAL EXIT"
           killall tail
           exit
           ;;
        "*")
          t="*"
          continue
          ;;
        "+")
          t="+"
          continue
          ;;
    esac
    if [[ $LINE =~ -?[0-9]+ ]]; then
       if [[ $t == "+" ]]; then
          acc=$(($acc+$LINE))
          else
          acc=$(($acc*$LINE))
       fi
       echo $acc
    else
       echo "INCORRECT INPUT"
       killall tail
       exit 1
    fi   
done 
