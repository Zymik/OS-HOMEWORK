#!/bin/bash
while true; do
read LINE
if [[ $LINE == "QUIT" ]]; then
   echo "QUIT" >> pipe
   exit
   else if [[ $LINE == "*" || $LINE == "+" || $LINE =~ -?[0-9]+ ]]; then
       echo "$LINE" >> pipe
   else
       echo "ERROR" >> pipe
       echo "INCORRECT INPUT"
       exit 1 
   fi
fi
done
