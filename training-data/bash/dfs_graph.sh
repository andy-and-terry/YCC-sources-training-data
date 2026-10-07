#!/usr/bin/env bash
set -euo pipefail

declare -A graph
graph[A]="B C"
graph[B]="A D E"
graph[C]="A F"
graph[D]="B"
graph[E]="B F"
graph[F]="C E"

declare -A visited
order=()

dfs() {
    local node=$1
    if [[ -n "${visited[$node]:-}" ]]; then
        return
    fi
    visited[$node]=1
    order+=("$node")

    local neighbor
    for neighbor in ${graph[$node]:-}; do
        dfs "$neighbor"
    done
}

dfs A
echo "${order[@]}"
