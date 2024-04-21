#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Error: Two arguments required - a file path and a string to write."
  exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create directory path if it does not exist
mkdir -p "$(dirname "$writefile")"

# Attempt to write to the file
echo "$writestr" > "$writefile"

# Check if the file write was successful
if [ $? -ne 0 ]; then
  echo "Error: Could not write to file '$writefile'."
  exit 1
fi

echo "File '$writefile' has been written successfully."
