#!/usr/bin/env bash
set -euo pipefail

fibonacci_search() {
    local x=$1 n=${#arr[@]} f2=0 f1=1 f=1 offset=-1 i
    while ((f < n)); do f2=$f1; f1=$f; f=$((f1 + f2)); done
    while ((f > 1)); do
        i=$((offset + f2 < n - 1 ? offset + f2 : n - 1))
        if ((arr[i] < x)); then
            f=$f1; f1=$f2; f2=$((f - f1)); offset=$i
        elif ((arr[i] > x)); then
            f=$f2; f1=$((f1 - f2)); f2=$((f - f1))
        else
            echo "$i"; return
        fi
    done
    if ((f1 && offset + 1 < n && arr[offset + 1] == x)); then echo $((offset + 1)); else echo -1; fi
}

arr=(10 22 35 40 45 50 80 82 85 90 100)
out=()
for x in "${arr[@]}" 11 101; do out+=("$(fibonacci_search "$x")"); done
echo "${out[*]}"
