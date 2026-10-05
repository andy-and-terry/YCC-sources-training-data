#!/usr/bin/env bash
set -euo pipefail

rows=6
row=(1)
for ((i = 0; i < rows; i++)); do
    echo "${row[*]}"
    next=(1)
    for ((j = 1; j < ${#row[@]}; j++)); do
        next+=($((row[j - 1] + row[j])))
    done
    next+=(1)
    row=("${next[@]}")
done
