#!/usr/bin/env bash
set -euo pipefail

file=$(mktemp)
printf "one\ntwo\nthree\n" > "$file"

while IFS= read -r line; do
    echo "line: $line"
done < "$file"

rm -f "$file"
