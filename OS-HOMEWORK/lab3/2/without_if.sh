#!/bin/bash
bash "$HOME/lab3/1/without_if.sh"
echo "bash $HOME/lab3/1/without_if.sh" | at now +1 minute &>/dev/null
bash tail.sh 
