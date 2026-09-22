#!/usr/bin/env bash
set -euo pipefail

declare -A graph
graph[shirt]="jacket"
graph[tie]="jacket"
graph[undershorts]="pants shoes"
graph[pants]="belt shoes"
graph[belt]=""
graph[jacket]=""
graph[shoes]=""

declare -A visited
declare -A on_stack
order=()

visit() {
    local node=$1
    if [[ -n "${visited[$node]:-}" ]]; then
        return
    fi
    if [[ -n "${on_stack[$node]:-}" ]]; then
        echo "cycle detected at $node" >&2
        exit 1
    fi
    on_stack[$node]=1

    local next
    for next in ${graph[$node]:-}; do
        visit "$next"
    done

    on_stack[$node]=""
    visited[$node]=1
    order=("$node" "${order[@]}")
}

for node in "${!graph[@]}"; do
    visit "$node"
done

echo "${order[@]}"
