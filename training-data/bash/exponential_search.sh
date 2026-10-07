#!/usr/bin/env bash
set -euo pipefail

exponential_search() {
    local t=$1 n=${#arr[@]} bound=1 lo hi mid
    ((n == 0)) && { echo -1; return; }
    ((arr[0] == t)) && { echo 0; return; }
    while ((bound < n && arr[bound] < t)); do bound=$((bound * 2)); done
    lo=$((bound / 2)); hi=$((bound < n - 1 ? bound : n - 1))
    while ((lo <= hi)); do
        mid=$(((lo + hi) / 2))
        if ((arr[mid] == t)); then echo "$mid"; return; fi
        if ((arr[mid] < t)); then lo=$((mid + 1)); else hi=$((mid - 1)); fi
    done
    echo -1
}

arr=()
for ((i = 0; i <= 40; i++)); do arr+=($((i * 3))); done
out=()
for t in 0 3 57 120 121 -5; do out+=("$(exponential_search "$t")"); done
echo "${out[*]}"
