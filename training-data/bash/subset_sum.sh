#!/usr/bin/env bash
set -euo pipefail

subset_sum() {
    local -n arr=$1
    local target=$2
    local n=${#arr[@]}
    local -a dp
    dp[0]=1
    for ((s = 1; s <= target; s++)); do
        dp[s]=0
    done
    for ((i = 0; i < n; i++)); do
        for ((s = target; s >= arr[i]; s--)); do
            if ((dp[s - arr[i]] == 1)); then
                dp[s]=1
            fi
        done
    done
    echo "${dp[target]}"
}

nums=(3 34 4 12 5 2)
subset_sum nums 9
subset_sum nums 60
subset_sum nums 61
