#!/bin/bash
ps -e -o "%u %p:%a" --sort -pid | awk -v user=$USER  'BEGIN {k = 0} 
{  if ($1==user){
    $1="";
    k++;
    print $0;
}
}
END {print k}' | tac > output.txt
