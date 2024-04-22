#!/bin/bash

input_file="log.txt"
output=""

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

while read -r line; do
    # Extract the last word of the line
    last_word=$(echo "$line" | awk '{print $NF}')

    # Check if the last word is "pypi"
    if [[ "$last_word" == "pypi" ]]; then
        # Extract package name and version
        name=$(echo "$line" | awk '{print $1}')
        version=$(echo "$line" | awk '{print $2}')

        # Format the output string
        output="$output$name==$version\n"
    fi
done < "$input_file"

echo -e "$output"
