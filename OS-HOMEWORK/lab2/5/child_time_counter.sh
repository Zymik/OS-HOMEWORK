#!/bin/bash
awk -F "[[:space:]]:[[:space:]]|=" '
function counter_print(ppid, time, counter)
{
print "Average_Running_Children_of_ParentID="ppid" is " time/counter
}

BEGIN {ppid = -1; counter = 0; time = 0} 
{
if (ppid == -1) 
{
     ppid = $4
} else if (ppid != $4)
{
     counter_print(ppid, time, counter)
     ppid = $4
     counter = 0
     time = 0
}; counter++; time += $6; print $0}
END { counter_print(ppid, time,  counter)} ' "../4/output.txt"
