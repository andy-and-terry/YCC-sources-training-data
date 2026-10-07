#!/usr/bin/env bash
set -euo pipefail

# Two-colors a graph via BFS; a neighbor already sharing the current
# node's color means the graph isn't bipartite.
check_bipartite() {
    local -n g=$1
    local -A color=()
    local start node node_color neighbor
    local -a queue

    for start in "${!g[@]}"; do
        if [[ -z "${color[$start]:-}" ]]; then
            color[$start]=0
            queue=("$start")
            while ((${#queue[@]} > 0)); do
                node=${queue[0]}
                queue=("${queue[@]:1}")
                node_color=${color[$node]}
                for neighbor in ${g[$node]:-}; do
                    if [[ -z "${color[$neighbor]:-}" ]]; then
                        color[$neighbor]=$((1 - node_color))
                        queue+=("$neighbor")
                    elif ((color[$neighbor] == node_color)); then
                        echo "false"
                        return
                    fi
                done
            done
        fi
    done
    echo "true"
}

declare -A even_cycle=([0]="1 3" [1]="0 2" [2]="1 3" [3]="0 2")
declare -A odd_cycle=([0]="1 2" [1]="0 2" [2]="0 1")

check_bipartite even_cycle
check_bipartite odd_cycle
