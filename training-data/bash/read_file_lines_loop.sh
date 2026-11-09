#!/usr/bin/env bash
file=${1:-/etc/hostname}
n=0
while IFS= read -r line; do
    n=$((n + 1))
    printf '%3d: %s\n' "$n" "$line"
done < "$file"
