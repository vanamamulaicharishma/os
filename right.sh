#!/bin/csh
# Script to check if three numbers form a right triangle
echo "Written by your name"

# Check for correct number of arguments
if ($#argv != 3) then
    echo "Usage: right.sh a b c"
    exit 1
endif

# Calculate squares
@ a = $argv[1] * $argv[1]
@ b = $argv[2] * $argv[2]
@ c = $argv[3] * $argv[3]

# Print the numbers without newline
echo -n "$argv[1] $argv[2] $argv[3] "

# Check if it's a right triangle using Pythagorean theorem
if (($a + $b == $c) || ($b + $c == $a) || ($a + $c == $b)) then
    echo "is a right triangle"
    exit 0
else
echo "is not a right triangle"

endif
