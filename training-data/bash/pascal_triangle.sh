#!/usr/bin/env bash
set -euo pipefail

rows=6
row=(1)
for ((r = 0; r < rows; r++)); do
    echo "${row[*]}"
    next=(1)
    for ((i = 1; i < ${#row[@]}; i++)); do
        next+=($((row[i - 1] + row[i])))
    done
    next+=(1)
    row=("${next[@]}")
done
