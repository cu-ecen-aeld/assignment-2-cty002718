#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Error: Two arguments required - a directory path and a search string."
  exit 1
fi

# Assign arguments to variables
filesdir=$1
searchstr=$2

# Check if the first argument is a directory
if [ ! -d "$filesdir" ]; then
  echo "Error: The specified directory does not exist or is not a directory."
  exit 1
fi

# Count the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of lines that contain the search string
num_matches=$(grep -roh "$searchstr" "$filesdir" | wc -l)

# Output the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"