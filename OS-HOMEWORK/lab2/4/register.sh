#!/bin/bash
space='[[:space:]]*'
ps -eo pid | grep -oh -E [0-9]+ |
while read pid; do
	if [[ -d "/proc/$pid" ]]; then
	    echo -n "ProcessID = $pid : "
	    echo -n "Parent_ProcessID = $(awk '{if ($1 == "PPid:") print $2}' /proc/$pid/status) : "
	    echo "Avarage_Running_Time = $(awk -F '([[:space:]]*):([[:space:]]*)'  '
	         BEGIN {v=0; k=0}
	         {if ($1 == "nr_switches") v=$2;
	         if ($1 == "se.sum_exec_runtime") k=$2}
	         END {print k/v}' /proc/$pid/sched)"
fi
done | sort -k7 -n | sed "s/ = /=/g" > output.txt
