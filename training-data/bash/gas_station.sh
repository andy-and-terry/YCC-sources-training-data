#!/usr/bin/env bash
set -euo pipefail

can_complete() {
    local -n gas=$1 cost=$2
    local total=0 tank=0 start=0 i d
    for ((i = 0; i < ${#gas[@]}; i++)); do
        d=$((gas[i] - cost[i]))
        total=$((total + d)); tank=$((tank + d))
        if ((tank < 0)); then tank=0; start=$((i + 1)); fi
    done
    ((total >= 0)) && echo "$start" || echo -1
}

g1=(1 2 3 4 5) c1=(3 4 5 1 2)
g2=(2 3 4) c2=(3 4 3)
echo "$(can_complete g1 c1) $(can_complete g2 c2)"
