#!/usr/bin/env bash
set -euo pipefail

count_lines() {
    local file=$1
    if [[ ! -f "$file" ]]; then
        echo "not found: $file" >&2
        return 1
    fi
    wc -l < "$file"
}

for f in "$@"; do
    echo "$f: $(count_lines "$f")"
done
