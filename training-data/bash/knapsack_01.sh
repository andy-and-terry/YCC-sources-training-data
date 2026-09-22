#!/usr/bin/env bash
set -euo pipefail

knapsack_01() {
    local -n weights=$1
    local -n values=$2
    local capacity=$3
    local n=${#weights[@]}
    local -a dp
    local w
    for ((w = 0; w <= capacity; w++)); do
        dp[w]=0
    done

    local i
    for ((i = 0; i < n; i++)); do
        for ((w = capacity; w >= weights[i]; w--)); do
            local candidate=$((dp[w - weights[i]] + values[i]))
            if ((candidate > dp[w])); then
                dp[w]=$candidate
            fi
        done
    done
    echo "${dp[capacity]}"
}

item_weights=(2 3 4 5)
item_values=(3 4 5 6)
knapsack_01 item_weights item_values 5
knapsack_01 item_weights item_values 10
