#!/bin/bash
echo $$ > .pid
acc=1
t="none"
usr1()
{
   t="+"
}

usr2()
{
   t="*"
}

term()
{
   t="term"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true; do
case $t in
    "+")
          acc=$(($acc+2))
          echo $acc
          t="none"
          ;;
    "*")
          acc=$(($acc*2))
          echo $acc
          t="none"
          ;;
    "term")
          echo "Was terminated by generator"
          exit
          ;;
    esac
sleep 1
done

