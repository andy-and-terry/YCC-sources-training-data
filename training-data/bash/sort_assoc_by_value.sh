#!/usr/bin/env bash
set -euo pipefail

declare -A score=([alice]=82 [bob]=95 [carol]=77)

# Print key/value pairs sorted by value, descending.
for k in "${!score[@]}"; do
    echo "${score[$k]} $k"
done | sort -rn | while read -r v k; do
    echo "$k: $v"
done
