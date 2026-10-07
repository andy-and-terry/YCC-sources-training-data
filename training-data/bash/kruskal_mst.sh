#!/usr/bin/env bash
set -euo pipefail

declare -A parent

find_root() {
    local x=$1
    while [[ "${parent[$x]}" != "$x" ]]; do
        x=${parent[$x]}
    done
    echo "$x"
}

union() {
    local ra rb
    ra=$(find_root "$1")
    rb=$(find_root "$2")
    [[ "$ra" == "$rb" ]] && return 1
    parent[$ra]=$rb
    return 0
}

nodes=(A B C D E)
for n in "${nodes[@]}"; do
    parent[$n]=$n
done

# Edges as "weight from to", pre-sorted ascending by weight.
edges=("1 A B" "2 B C" "3 A C" "4 C D" "5 D E")

total=0
for edge in "${edges[@]}"; do
    read -r w from to <<<"$edge"
    if union "$from" "$to"; then
        echo "Include $from-$to (weight $w)"
        total=$((total + w))
    fi
done
echo "Total MST weight: $total"
