#!/bin/bash
while true 
do
    echo "1: open vi"
    echo "2: open nano"
    echo "3: open links"
    echo "4: exit menu"
    read input
    case $input in
        	1 ) vi;;
        	2 ) nano;;
	        3 ) links;;
      	        4 ) exit;;
    esac
done
