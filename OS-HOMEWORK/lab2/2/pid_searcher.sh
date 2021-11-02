#!/bin/bash
ps -e -o pid,cmd | awk  '{pid = $1; $1="" ;if ($0 ~ /\/usr\/sbin\/(.*)/) print pid}' > output.txt
