#!/bin/bash
pid=$(cat .pid)
while true; do
      read LINE
      case $LINE in
      "TERM")
         kill -SIGTERM $pid
         exit
         ;;
      "*")
         kill -USR2 $pid
         ;;
      "+")
         kill -USR1 $pid
         ;;
 esac
done
