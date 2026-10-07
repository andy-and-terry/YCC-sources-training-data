#!/usr/bin/env bash
set -euo pipefail

# Nodes live in parallel arrays; -1 is the null pointer.
val=() next=()
new_node() { val+=("$1"); next+=(-1); NODE=$((${#val[@]} - 1)); }

from_list() {
    local head=-1 prev=-1 v
    for v in "$@"; do
        new_node "$v"
        if ((prev < 0)); then head=$NODE; else next[prev]=$NODE; fi
        prev=$NODE
    done
    HEAD=$head
}

to_list() { local n=$1 out=(); while ((n >= 0)); do out+=("${val[n]}"); n=${next[n]}; done; echo "${out[*]}"; }

merge() {
    local a=$1 b=$2 dummy tail
    new_node 0; dummy=$NODE; tail=$dummy
    while ((a >= 0 && b >= 0)); do
        if ((val[a] <= val[b])); then next[tail]=$a; a=${next[a]}; else next[tail]=$b; b=${next[b]}; fi
        tail=${next[tail]}
    done
    next[tail]=$((a >= 0 ? a : b))
    HEAD=${next[dummy]}
}

from_list 1 2 4 9; l1=$HEAD
from_list 1 3 4 5 10; l2=$HEAD
merge "$l1" "$l2"
to_list "$HEAD"
from_list 7; merge -1 "$HEAD"
to_list "$HEAD"
