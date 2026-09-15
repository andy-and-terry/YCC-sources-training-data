#!/usr/bin/env bash
set -euo pipefail

declare -A parent
declare -A rank_of

uf_make_set() {
    local x=$1
    parent[$x]=$x
    rank_of[$x]=0
}

uf_find() {
    local x=$1
    while [[ "${parent[$x]}" != "$x" ]]; do
        parent[$x]=${parent[${parent[$x]}]}
        x=${parent[$x]}
    done
    echo "$x"
}

uf_union() {
    local a=$1
    local b=$2
    local root_a root_b
    root_a=$(uf_find "$a")
    root_b=$(uf_find "$b")

    if [[ "$root_a" == "$root_b" ]]; then
        return
    fi

    if ((rank_of[$root_a] < rank_of[$root_b])); then
        parent[$root_a]=$root_b
    elif ((rank_of[$root_a] > rank_of[$root_b])); then
        parent[$root_b]=$root_a
    else
        parent[$root_b]=$root_a
        rank_of[$root_a]=$((rank_of[$root_a] + 1))
    fi
}

for node in 1 2 3 4 5 6; do
    uf_make_set "$node"
done

uf_union 1 2
uf_union 2 3
uf_union 4 5

echo "find(1)=$(uf_find 1) find(3)=$(uf_find 3)"
echo "same set 1,3: $([[ $(uf_find 1) == $(uf_find 3) ]] && echo true || echo false)"
echo "same set 1,4: $([[ $(uf_find 1) == $(uf_find 4) ]] && echo true || echo false)"
