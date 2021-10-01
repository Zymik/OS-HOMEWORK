#!/bin/bash
if [[ $PWD = $HOME ]]; then
	echo $HOME
	echo 0
else
	echo "Error: you are not in home directory" 1>&2
	echo 1
fi
