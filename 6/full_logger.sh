#!/bin/bash
awk '{if ($3 == "(WW)") {$3="Warning:"; print $0}}' /var/log/anaconda/X.log > log.txt
awk '{if ($3 == "(II)") {$3="Information:"; print $0}}' /var/log/anaconda/X.log >> log.txt

