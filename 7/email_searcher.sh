#!/bin/bash
regex='[a-z0-9\-\._]+@([a-z0-9]+\.[a-z0-9]+)+'
grep -E -I -oh -d skip $regex /etc/* | sort | uniq | tr "\n" "," | sed 's/.$//' > email.lst
