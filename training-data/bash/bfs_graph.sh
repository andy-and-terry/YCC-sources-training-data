#!/usr/bin/env bash
set -euo pipefail

declare -A graph
graph[A]="B C"
graph[B]="A D E"
graph[C]="A F"
graph[D]="B"
graph[E]="B F"
graph[F]="C E"

bfs() {
    local start=$1
    declare -A visited
    local -a queue=("$start")
    visited[$start]=1
    local -a order=()

    while ((${#queue[@]} > 0)); do
        local node=${queue[0]}
        queue=("${queue[@]:1}")
        order+=("$node")

        local neighbor
        for neighbor in ${graph[$node]:-}; do
            if [[ -z "${visited[$neighbor]:-}" ]]; then
                visited[$neighbor]=1
                queue+=("$neighbor")
            fi
        done
    done
    echo "${order[@]}"
}

bfs A
