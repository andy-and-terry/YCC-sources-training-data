#!/usr/bin/env bash
set -euo pipefail

knapsack_01() {
    local -n weights=$1
    local -n values=$2
    local capacity=$3
    local n=${#weights[@]}
    local -a dp
    local i w

    for ((w = 0; w <= capacity; w++)); do
        dp[w]=0
    done

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

weights=(1 3 4 5)
values=(1 4 5 7)
knapsack_01 weights values 7
