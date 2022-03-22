#!/bin/bash
from="$1"
to="$2"
dir=$(dirname "$to")
if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
fi

if [[ -f "$2" ]]; then
   rm "$2"
fi
cp "$1" "$2"
