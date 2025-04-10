#!/bin/sh
# Multifunction Utility Script
# Author: your name

echo "Written by yourname"

# Function to display usage
usage() {
    echo "Usage: $0 [-f searchstr file] [-r n1 n2 n3] [-c file1 [file2 ...]]"
    exit 1
}

# Function to check if a string is a valid number
is_number() {
    case $1 in
        ''|*[!0-9-]*) return 1 ;;
        *) return 0 ;;
    esac
}

# Check if we have arguments
if [ $# -eq 0 ]; then
    usage
fi

# Process arguments
while [ $# -gt 0 ]; do
    case "$1" in
        -f)
            # Check if we have enough arguments for -f
            if [ $# -lt 3 ]; then
                echo "Error: -f requires searchstring and filename"
                shift
                continue
            fi
            # Call findtext.sh with arguments
            ./findtext.sh "$2" "$3"
            shift 3
            ;;

        -r)
            # Check if we have enough arguments for -r
            if [ $# -lt 4 ]; then
                echo "Error: -r requires three numbers"
                shift
                continue
            fi
            # Validate numbers
            for num in "$2" "$3" "$4"; do
                if ! is_number "$num"; then
                    echo "Error: Invalid number '$num'"
                    shift 4
                    continue 2
                fi
            done
            # Call right.sh with arguments
            ./right.sh "$2" "$3" "$4"
            shift 4
            ;;

        -c)
            # Check if we have at least one file argument
            if [ $# -lt 2 ]; then
                echo "Error: -c requires at least one filename"
                shift
                continue
            fi
            shift
            # Process all files until next option or end
            while [ $# -gt 0 ] && ! echo "$1" | grep -q "^-"; do
                ./count.sh "$1"
                shift
            done
            ;;

        -*)
            # Handle invalid options
            echo -n "Error: Invalid option '$1'"
            shift
            # Print all parameters until next option
            while [ $# -gt 0 ] && ! echo "$1" | grep -q "^-"; do
                echo -n " $1"
                shift
            done
            echo
            ;;

        *)
            # Handle unexpected arguments
            echo "Error: Expected option starting with '-', got '$1'"
            shift
            ;;
    esac
done

exit 0
