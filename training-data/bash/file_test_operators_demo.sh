#!/usr/bin/env bash
set -euo pipefail

dir=$(mktemp -d)
file="$dir/sample.txt"
echo "hello" > "$file"
chmod +r "$file"

if [[ -d "$dir" ]]; then
    echo "$dir is a directory"
fi

if [[ -f "$file" ]]; then
    echo "sample.txt is a regular file"
fi

if [[ -r "$file" && -s "$file" ]]; then
    echo "sample.txt is readable and non-empty"
fi

if [[ ! -e "$dir/missing.txt" ]]; then
    echo "missing.txt does not exist"
fi

rm -rf "$dir"
