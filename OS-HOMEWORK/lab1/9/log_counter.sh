#!/bin/bash
#grep --include="*.log" -h -r "" /var/log/ | wc -l #recursive
cat /var/log/*.log | wc -l
