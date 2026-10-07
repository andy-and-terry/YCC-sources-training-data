#!/usr/bin/env bash
set -euo pipefail

ternary_search() {
    local t=$1 lo=0 hi=$((${#arr[@]} - 1)) third m1 m2
    while ((lo <= hi)); do
        third=$(((hi - lo) / 3)); m1=$((lo + third)); m2=$((hi - third))
        ((arr[m1] == t)) && { echo "$m1"; return; }
        ((arr[m2] == t)) && { echo "$m2"; return; }
        if ((t < arr[m1])); then hi=$((m1 - 1))
        elif ((t > arr[m2])); then lo=$((m2 + 1))
        else lo=$((m1 + 1)); hi=$((m2 - 1)); fi
    done
    echo -1
}

arr=(1 3 5 7 9 11 13 15 17)
out=()
for t in 1 9 17 4; do out+=("$(ternary_search "$t")"); done
echo "${out[*]}"

# Maximum of a unimodal function, f(x) = -(x-2)^2 + 3, done in awk.
awk 'function f(x) { return -(x - 2) ^ 2 + 3 }
     BEGIN { lo = -10; hi = 10
             while (hi - lo > 1e-9) { m1 = lo + (hi - lo) / 3; m2 = hi - (hi - lo) / 3; if (f(m1) < f(m2)) lo = m1; else hi = m2 }
             printf "argmax of -(x-2)^2+3 on [-10,10]: %.6f\n", (lo + hi) / 2 }'
