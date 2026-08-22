#!/usr/bin/env bash
set -euo pipefail

dir=$(mktemp -d)
touch "$dir/a.txt" "$dir/b.txt"
mkdir "$dir/sub"
touch "$dir/sub/c.txt"

find "$dir" -type f -name "*.txt" | sort

rm -rf "$dir"
