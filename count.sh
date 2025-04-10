#!/bin/csh
# Script to count characters, words, and lines in files
echo "Written by your name"

if ($#argv < 1) then
    echo "Usage: count.s filename(s)"
    exit 1
endif

foreach file ($argv)
    if (-f "$file") then
        echo "$file"
        wc -c "$file" | awk '{print $1" characters"}'
        wc -w "$file" | awk '{print $1" words"}'
        wc -l "$file" | awk '{print $1" lines"}'
    else
        echo "File $file not found"
    endif
end
