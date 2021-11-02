#!/bin/bash
start=$(date +"%d_%m_%y_%T")
mkdir $HOME/test && 
{
    #echo "catalog test was created successfully"
    touch $HOME/test/$start
}

ping net_nikogo.ru || 
{
    echo $(date +"%d_%m_%y_%T") no access $1 >> $HOME/report
#echo "1" > $HOME/report
} 
