#!/bin/bash
man bash | grep -E -oh -w '[[:alpha:]]+' | sort | uniq -c | sort -r -n -k1 | head -n 3
