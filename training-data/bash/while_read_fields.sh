#!/usr/bin/env bash
# Parse colon-separated records with IFS and read.
data=$'root:x:0:/root\nalice:x:1000:/home/alice\nbob:x:1001:/home/bob'
while IFS=: read -r user _ uid home; do
    printf '%-6s uid=%-5s home=%s\n' "$user" "$uid" "$home"
done <<< "$data"
