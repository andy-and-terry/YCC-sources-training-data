#!/usr/bin/env bash
set -euo pipefail

merge_two() {
    local -n x=$1 y=$2
    local i=0 j=0 out=()
    while ((i < ${#x[@]} && j < ${#y[@]})); do
        if ((x[i] <= y[j])); then out+=("${x[i]}"); i=$((i + 1)); else out+=("${y[j]}"); j=$((j + 1)); fi
    done
    out+=("${x[@]:i}" "${y[@]:j}")
    echo "${out[*]}"
}

a=(1 4 7) b=(2 3 8 9)
merge_two a b

# k-way merge of already sorted lists: sort -m merges without re-sorting.
sort -m -n <(printf '%s\n' 1 5 9) <(printf '%s\n' 2 6) <(printf '') <(printf '%s\n' 0 3 4 10) | paste -sd' '
