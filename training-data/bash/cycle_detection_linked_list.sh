#!/usr/bin/env bash
set -euo pipefail

# A linked list as two arrays: val[i] and next[i] (-1 = null).
build() {
    local n=$1 loop_to=$2 i
    val=() next=()
    for ((i = 0; i < n; i++)); do val[i]=$((i + 1)); next[i]=$((i + 1)); done
    next[n - 1]=$loop_to
}

# Floyd's tortoise and hare.
find_cycle() {
    local slow=0 fast=0 p len q
    while ((fast != -1 && next[fast] != -1)); do
        slow=${next[slow]}
        fast=${next[${next[fast]}]}
        if ((slow == fast)); then
            p=0
            while ((p != slow)); do p=${next[p]}; slow=${next[slow]}; done
            len=1; q=${next[p]}
            while ((q != p)); do q=${next[q]}; len=$((len + 1)); done
            echo "cycle starts at ${val[p]}, length $len"
            return
        fi
    done
    echo "no cycle"
}

build 6 2
find_cycle
build 4 -1
find_cycle
