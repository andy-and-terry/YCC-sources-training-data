#!/usr/bin/env bash
# Collapse consecutive duplicate characters.
s="aabbbcdd"
out=""; prev=""
for ((i = 0; i < ${#s}; i++)); do
  c=${s:i:1}
  [[ $c != "$prev" ]] && out+=$c
  prev=$c
done
echo "$out"
