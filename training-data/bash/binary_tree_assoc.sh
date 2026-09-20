#!/usr/bin/env bash
set -euo pipefail

# A binary search tree built from associative arrays: each node id maps to
# its value, left child id, and right child id.
declare -A node_value
declare -A node_left
declare -A node_right
next_id=0
root=""
last_new_id=""

# Modifies the associative arrays directly (rather than returning the new
# id via command substitution) since a $(...) subshell would only mutate
# its own copy of these arrays and the inserts would be silently lost.
new_node() {
    local id="n$next_id"
    next_id=$((next_id + 1))
    node_value[$id]=$1
    node_left[$id]=""
    node_right[$id]=""
    last_new_id=$id
}

insert() {
    local value=$1
    if [[ -z "$root" ]]; then
        new_node "$value"
        root=$last_new_id
        return
    fi
    local cur=$root
    while true; do
        if ((value < node_value[cur])); then
            if [[ -z "${node_left[$cur]}" ]]; then
                new_node "$value"
                node_left[$cur]=$last_new_id
                return
            fi
            cur=${node_left[$cur]}
        else
            if [[ -z "${node_right[$cur]}" ]]; then
                new_node "$value"
                node_right[$cur]=$last_new_id
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
