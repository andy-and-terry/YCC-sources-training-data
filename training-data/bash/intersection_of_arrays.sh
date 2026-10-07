#!/usr/bin/env bash
set -euo pipefail

intersect_unique() {
    local -n x=$1 y=$2
    local -A in_y=() seen=()
    local v out=()
    for v in "${y[@]}"; do in_y[$v]=1; done
    for v in "${x[@]}"; do
        [[ -n ${in_y[$v]:-} && -z ${seen[$v]:-} ]] && { out+=("$v"); seen[$v]=1; }
    done
    echo "${out[*]}"
}

intersect_multi() {
    local -n x=$1 y=$2
    local -A count=()
    local v out=()
    for v in "${y[@]}"; do count[$v]=$((${count[$v]:-0} + 1)); done
    for v in "${x[@]}"; do
        if ((${count[$v]:-0} > 0)); then out+=("$v"); count[$v]=$((count[$v] - 1)); fi
    done
    echo "${out[*]}"
}

# Two sorted inputs: comm(1) does it directly.
intersect_sorted() { comm -12 <(printf '%s\n' $1) <(printf '%s\n' $2) | paste -sd' '; }

a=(4 9 5 9 4) b=(9 4 9 8 4)
echo "$(intersect_unique a b) | $(intersect_multi a b) | $(intersect_sorted '1 2 2 3 5' '2 2 5 7')"
