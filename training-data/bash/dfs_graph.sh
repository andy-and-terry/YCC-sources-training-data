#!/usr/bin/env bash
set -euo pipefail

declare -A graph=(
    [a]="b c"
    [b]="d"
    [c]="d"
    [d]="e"
    [e]=""
)

declare -A visited
order=()

dfs() {
    local node=$1
    if [[ -n ${visited[$node]:-} ]]; then
        return
    fi
    visited[$node]=1
    order+=("$node")
    local neighbor
    for neighbor in ${graph[$node]}; do
        dfs "$neighbor"
    done
}

dfs "a"
echo "${order[@]}"
