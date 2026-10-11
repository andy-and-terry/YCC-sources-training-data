#!/usr/bin/env bash
# Split a string into an array of characters.
s="bash"
chars=()
for ((i = 0; i < ${#s}; i++)); do chars+=("${s:i:1}"); done
printf '[%s] ' "${chars[@]}"; echo
echo "count: ${#chars[@]}"
