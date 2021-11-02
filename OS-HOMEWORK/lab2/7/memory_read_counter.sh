#!/bin/bash
space='[[:space:]]*'
ps -eo pid | grep -oh -E [0-9]+ |
while read pid; do
      if [[ -d "/proc/$pid" ]]; then
          echo -n "$pid "
          echo "$(awk '{if ($1 == "read_bytes:") print $2}' /proc/$pid/io)"
  fi
  done > buffer.txt
sleep 5s
ps -eo pid | grep -oh -E [0-9]+ |
while read pid; do
        if [[ -d "/proc/$pid" ]]; then
          echo -n "$pid|"
          cat "/proc/$pid/cmdline"
          echo -n "|"
          end=$(awk '{if ($1 == "read_bytes:") print $2}' /proc/$pid/io)
          begin=$(awk -v awk_pid=$pid 'BEGIN {flag=0} 
                 {if ($1 == awk_pid){
                      flag=1
                      print $2}} END {if (flag == 0) print 0}' "buffer.txt")          
           echo $(($end-$begin))
                              
fi
done | sort -k3 -t "|"  -n -r | head -n 3  | sed 's/|/:/g'
rm -f buffer.txt
