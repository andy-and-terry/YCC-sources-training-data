#!/usr/bin/env bash
set -euo pipefail

# Dictionary-of-keys sparse matrices: associative arrays keyed "row,col", zeros not stored.
declare -A A=() B=() P=()

load() {
    local -n m=$1
    local r=0 c v row
    while read -r row; do
        c=0
        for v in $row; do ((v != 0)) && m["$r,$c"]=$v; c=$((c + 1)); done
        r=$((r + 1))
    done
}

load A <<<$'1 0 0\n0 0 2\n0 3 0'
load B <<<$'0 4\n5 0\n0 6'

# P = A * B, touching only stored entries.
for ka in "${!A[@]}"; do
    i=${ka%,*} k=${ka#*,}
    for kb in "${!B[@]}"; do
        [[ ${kb%,*} == "$k" ]] || continue
        j=${kb#*,}
        P["$i,$j"]=$((${P["$i,$j"]:-0} + A[$ka] * B[$kb]))
    done
done

echo "nnz(A)=${#A[@]} nnz(P)=${#P[@]}"
for ((i = 0; i < 3; i++)); do
    row=()
    for ((j = 0; j < 2; j++)); do row+=("${P["$i,$j"]:-0}"); done
    echo "${row[*]}"
done
