#!/bin/csh
# Script to find text in a file
echo "Written by your name"

if ($#argv != 2) then
    echo "Usage: findtext.sh search_string filename"
    exit 1
endif

set string="$argv[1]"
set file="$argv[2]"

if (-f "$file") then
    echo "$file"
    grep -n "$string" "$file" | sed 's/:/. /'
else
    echo "File $file not found"
endif
