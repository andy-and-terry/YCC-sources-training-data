#!/usr/bin/env bash
set -euo pipefail

interpolation_search() {
    local x=$1 lo=0 hi=$((${#arr[@]} - 1)) p
    while ((lo <= hi && x >= arr[lo] && x <= arr[hi])); do
        if ((arr[hi] == arr[lo])); then
            ((arr[lo] == x)) && echo "$lo" || echo -1
            return
        fi
        p=$((lo + (x - arr[lo]) * (hi - lo) / (arr[hi] - arr[lo])))
        if ((arr[p] == x)); then echo "$p"; return; fi
        if ((arr[p] < x)); then lo=$((p + 1)); else hi=$((p - 1)); fi
    done
    echo -1
}

arr=()
for ((i = 0; i < 100; i++)); do arr+=($((i * 10 + 5))); done
out=()
for x in 5 505 995 500 1000; do out+=("$(interpolation_search "$x")"); done
echo "${out[*]}"
arr=(7 7 7 7 7)
echo "$(interpolation_search 7) $(interpolation_search 8)"
