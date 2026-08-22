#!/usr/bin/env bash
set -euo pipefail

file=$(mktemp)
printf "name,age\nAda,30\nBob,25\n" > "$file"

{
    read -r header
    while IFS=, read -r name age; do
        echo "$name is $age years old"
    done
} < "$file"

rm -f "$file"
