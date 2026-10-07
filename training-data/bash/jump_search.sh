#!/usr/bin/env bash
set -euo pipefail

jump_search() {
    local x=$1 n=${#arr[@]} step prev=0 cur i
    step=$(awk -v n="$n" 'BEGIN { s = int(sqrt(n)); print (s < 1 ? 1 : s) }')
    cur=$step
    while ((cur < n && arr[cur - 1] < x)); do prev=$cur; cur=$((cur + step)); done
    ((cur > n)) && cur=$n
    for ((i = prev; i < cur; i++)); do
        ((arr[i] == x)) && { echo "$i"; return; }
        ((arr[i] > x)) && break
    done
    echo -1
}

arr=(0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610)
out=()
for x in 0 55 610 4 700; do out+=("$(jump_search "$x")"); done
echo "${out[*]}"
