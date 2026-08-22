#!/usr/bin/env bash
set -euo pipefail

declare -A scores=(
    [Ada]=88
    [Bob]=72
    [Cleo]=95
)

for name in $(echo "${!scores[@]}" | tr ' ' '\n' | sort); do
    echo "$name: ${scores[$name]}"
done
