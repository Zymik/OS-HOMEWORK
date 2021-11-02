#!/bin/bash
if [[ $PWD = $HOME ]]; then
	echo $HOME
	exit 0
else
	echo "Error: you are not in home directory" 1>&2
	exit 1
fi
