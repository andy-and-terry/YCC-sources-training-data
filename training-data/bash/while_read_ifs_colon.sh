#!/usr/bin/env bash
# Parse colon-separated passwd-style records.
data='root:x:0:/root
alice:x:1000:/home/alice
bob:x:1001:/home/bob'
while IFS=: read -r user _ uid home; do
    printf '%-6s uid=%-5s home=%s\n' "$user" "$uid" "$home"
done <<< "$data"
