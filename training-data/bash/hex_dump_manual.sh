#!/usr/bin/env bash
# Print hex and ASCII of a string, 8 bytes per row.
str="Hello, bash hex dump!"
for ((i = 0; i < ${#str}; i += 8)); do
    chunk=${str:i:8}
    hex=$(printf '%s' "$chunk" | od -An -tx1 | tr -s ' ')
    printf '%04x:%-26s |%s|\n' "$i" "$hex" "$chunk"
done
