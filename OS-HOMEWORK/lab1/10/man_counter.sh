#!/bin/bash
man bash | grep -E -oh '[a-zA-Z]{4,}' | sort | uniq -c | sort -r -n -k1 | head -n 3
