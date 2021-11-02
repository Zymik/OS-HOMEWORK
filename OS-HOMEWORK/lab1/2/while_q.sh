#!/bin/bash
answer=""
while true
do
  read A
  if [[ $A == "q" ]] 
  then break
  fi
  answer=$answer$A
done
echo $answer
