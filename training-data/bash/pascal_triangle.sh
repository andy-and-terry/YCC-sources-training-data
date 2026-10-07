#!/usr/bin/env bash
set -euo pipefail

rows=8
lines=() row=(1)
for ((r = 0; r < rows; r++)); do
    lines+=("${row[*]}")
    next=(1)
    for ((i = 1; i < ${#row[@]}; i++)); do next+=($((row[i - 1] + row[i]))); done
    next+=(1)
    row=("${next[@]}")
done

width=${#lines[-1]}
for line in "${lines[@]}"; do
    printf '%*s%s\n' $(((width - ${#line}) / 2)) '' "$line"
done
