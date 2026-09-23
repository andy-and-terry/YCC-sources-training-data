#!/usr/bin/env bash
set -euo pipefail

word_break() {
    local s=$1
    shift
    local -A dict=()
    local w
    for w in "$@"; do
        dict[$w]=1
    done

    local n=${#s}
    local -a dp
    dp[0]=1
    local i j
    for ((i = 1; i <= n; i++)); do
        dp[i]=0
        for ((j = 0; j < i; j++)); do
            if ((dp[j] == 1)) && [[ -n "${dict[${s:j:i-j}]:-}" ]]; then
                dp[i]=1
                break
            fi
        done
    done

    if ((dp[n] == 1)); then
        echo "true"
    else
        echo "false"
    fi
}

word_break "leetcode" "leet" "code"
word_break "catsandog" "cats" "dog" "sand" "and" "cat"
