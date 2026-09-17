#!/usr/bin/env bash
set -euo pipefail

mapfile -t lines <<EOF
first
second
third
EOF

for i in "${!lines[@]}"; do
    echo "$i: ${lines[$i]}"
done
echo "count: ${#lines[@]}"
