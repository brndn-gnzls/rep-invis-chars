#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Having to use Perl to explicitly replace non-breaking space (\u00A0)
# and other control characters with spaces to preserve line breaks.
perl -CSD -pe 's/\x{00A0}|[^\P{Cc}\r\n]/ /g;' "$input_file" > "$output_file"

echo "Processed file saved to $output_file"