#!/bin/bash
read pid < pid1.txt
cpulimit -p $pid -l 10
