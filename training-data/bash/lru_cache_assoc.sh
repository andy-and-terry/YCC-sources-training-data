#!/usr/bin/env bash
set -euo pipefail

declare -A cache
declare -a order=()
capacity=2
LRU_RESULT=""

touch_key() {
    local key=$1
    local -a new_order=()
    for k in "${order[@]}"; do
        [[ "$k" != "$key" ]] && new_order+=("$k")
    done
    new_order+=("$key")
    order=("${new_order[@]}")
}

# Sets LRU_RESULT instead of echoing, so it can be called directly
# (not via command substitution) and its touch_key side effect on the
# shared `order` array survives -- a subshell from $(...) would discard it.
lru_get() {
    local key=$1
    if [[ -n "${cache[$key]:-}" ]]; then
        touch_key "$key"
        LRU_RESULT="${cache[$key]}"
    else
        LRU_RESULT="-1"
    fi
}

lru_put() {
    local key=$1 value=$2
    cache[$key]=$value
    touch_key "$key"
    if ((${#order[@]} > capacity)); then
        local evict=${order[0]}
        order=("${order[@]:1}")
        unset "cache[$evict]"
    fi
}

lru_put 1 100
lru_put 2 200
lru_get 1
echo "get 1: $LRU_RESULT"
lru_put 3 300   # evicts key 2 (least recently used)
lru_get 2
echo "get 2: $LRU_RESULT"
lru_get 3
echo "get 3: $LRU_RESULT"
