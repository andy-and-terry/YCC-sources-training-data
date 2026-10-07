#!/usr/bin/env bash
set -euo pipefail

results=()

gen() {
    local s=$1 open=$2 close=$3 n=$4
    if ((${#s} == 2 * n)); then results+=("$s"); return; fi
    if ((open < n)); then gen "$s(" $((open + 1)) "$close" "$n"; fi
    if ((close < open)); then gen "$s)" "$open" $((close + 1)) "$n"; fi
}

results=(); gen '' 0 0 3
echo "${results[*]}"
counts=()
for n in 1 2 3 4 5 6 7; do results=(); gen '' 0 0 "$n"; counts+=("${#results[@]}"); done
echo "counts: ${counts[*]}"
