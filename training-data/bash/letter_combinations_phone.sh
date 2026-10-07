#!/usr/bin/env bash
set -euo pipefail

declare -A KEYS=([2]=abc [3]=def [4]=ghi [5]=jkl [6]=mno [7]=pqrs [8]=tuv [9]=wxyz)

combos() {
    local digits=$1 out=('') next d letters p i
    [[ -z $digits ]] && return
    for ((i = 0; i < ${#digits}; i++)); do
        d=${digits:i:1}
        letters=${KEYS[$d]:-}
        [[ -n $letters ]] || { echo "no letters for $d" >&2; return 1; }
        next=()
        for p in "${out[@]}"; do
            for ((j = 0; j < ${#letters}; j++)); do next+=("$p${letters:j:1}"); done
        done
        out=("${next[@]}")
    done
    echo "${out[*]}"
}

combos 23
read -ra all <<<"$(combos 79)"
echo "${#all[@]} combos for 79"
# brace expansion gives the same cartesian product
echo {a,b,c}{d,e,f}
