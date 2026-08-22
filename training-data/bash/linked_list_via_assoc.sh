#!/usr/bin/env bash
set -euo pipefail

declare -A next_node
declare -A node_value
head=""

push_front() {
    local id="n$RANDOM$RANDOM"
    node_value[$id]=$1
    next_node[$id]=$head
    head=$id
}

print_list() {
    local cur=$head
    while [[ -n "$cur" ]]; do
        printf "%s " "${node_value[$cur]}"
        cur=${next_node[$cur]:-}
    done
    echo
}

push_front 3
push_front 2
push_front 1
print_list
