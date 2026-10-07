#!/usr/bin/env bash
set -euo pipefail

# Paths from top-left to bottom-right moving only right/down; '#' cells are blocked.
unique_paths() {
    local grid=("$@") rows=$# cols=${#1} r c
    local dp=()
    for ((c = 0; c < cols; c++)); do dp[c]=0; done
    dp[0]=1
    for ((r = 0; r < rows; r++)); do
        for ((c = 0; c < cols; c++)); do
            if [[ ${grid[r]:c:1} == '#' ]]; then dp[c]=0
            elif ((c > 0)); then dp[c]=$((dp[c] + dp[c - 1])); fi
        done
    done
    echo "${dp[cols - 1]}"
}

# Without obstacles the answer is C(m+n-2, m-1).
binom() { local n=$1 k=$2 r=1 i; for ((i = 1; i <= k; i++)); do r=$((r * (n - k + i) / i)); done; echo "$r"; }

echo "3x7 open: $(unique_paths ....... ....... .......) (formula $(binom 8 2))"
echo "3x3 with center blocked: $(unique_paths ... .#. ...)"
echo "blocked start: $(unique_paths '#.' '..')"
