#!/usr/bin/env bash
set -euo pipefail

# A binary search tree built from associative arrays: each node id maps to
# its value, left child id, and right child id.
declare -A node_value
declare -A node_left
declare -A node_right
next_id=0
root=""

new_node() {
    local id="n$next_id"
    next_id=$((next_id + 1))
    node_value[$id]=$1
    node_left[$id]=""
    node_right[$id]=""
    echo "$id"
}

insert() {
    local value=$1
    if [[ -z "$root" ]]; then
        root=$(new_node "$value")
        return
    fi
    local cur=$root
    while true; do
        if ((value < node_value[cur])); then
            if [[ -z "${node_left[$cur]}" ]]; then
                node_left[$cur]=$(new_node "$value")
                return
            fi
            cur=${node_left[$cur]}
        else
            if [[ -z "${node_right[$cur]}" ]]; then
                node_right[$cur]=$(new_node "$value")
                return
            fi
            cur=${node_right[$cur]}
        fi
    done
}

inorder() {
    local id=$1
    [[ -z "$id" ]] && return
    inorder "${node_left[$id]}"
    printf "%s " "${node_value[$id]}"
    inorder "${node_right[$id]}"
}

for value in 5 3 8 1 4 7 9; do
    insert "$value"
done

inorder "$root"
echo
