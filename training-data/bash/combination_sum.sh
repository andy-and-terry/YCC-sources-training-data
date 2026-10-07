#!/usr/bin/env bash
set -euo pipefail

results=()

search() {
    local start=$1 remain=$2 path=$3 i c
    if ((remain == 0)); then results+=("[${path# }]"); return; fi
    for ((i = start; i < ${#cands[@]}; i++)); do
        c=${cands[i]}
        ((c > remain)) && break
        search "$i" $((remain - c)) "$path $c"
    done
}

combination_sum() {
    local target=$1
    shift
    mapfile -t cands < <(printf '%s\n' "$@" | sort -n)
    results=()
    search 0 "$target" ''
    echo "${results[*]}"
}

combination_sum 7 2 3 6 7
combination_sum 8 2 3 5
