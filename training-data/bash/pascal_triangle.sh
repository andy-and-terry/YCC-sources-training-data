#!/usr/bin/env bash
set -euo pipefail

rows=6
declare -a prev=(1)

for ((i = 0; i < rows; i++)); do
    echo "${prev[*]}"
    declare -a curr=(1)
    for ((j = 1; j <= i + 1; j++)); do
        curr[j]=$(( prev[j - 1] + ${prev[j]:-0} ))
    done
    prev=("${curr[@]}")
    unset curr
done
