#!/bin/bash
echo "By script: "
ps -eo pid | grep -oh -E [0-9]+ |
while read pid; do
    if [[ -d "/proc/$pid" ]]; then
        echo "$pid " $(awk '{print $1}' "/proc/$pid/statm")
       
fi
done | sort -k2 -n -r | head -n 1 | awk '{print $1}'
echo "By top:"
top -o VIRT -b -n 1 | head -n 8 | tail -n 1 | awk '{print $1}' 
