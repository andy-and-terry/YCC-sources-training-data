#!/usr/bin/env bash
set -euo pipefail

rows=3 cols=3
g=(1 3 1 1 5 1 4 2 1)

dp=()
for ((r = 0; r < rows; r++)); do
    for ((c = 0; c < cols; c++)); do
        i=$((r * cols + c))
        if ((r == 0 && c == 0)); then dp[i]=${g[i]}
        elif ((r == 0)); then dp[i]=$((g[i] + dp[i - 1]))
        elif ((c == 0)); then dp[i]=$((g[i] + dp[i - cols]))
        else
            up=${dp[i - cols]} left=${dp[i - 1]}
            dp[i]=$((g[i] + (up < left ? up : left)))
        fi
    done
done

r=$((rows - 1)) c=$((cols - 1)) path=("($r,$c)")
while ((r > 0 || c > 0)); do
    if ((r == 0)) || { ((c > 0)) && ((dp[r * cols + c - 1] < dp[(r - 1) * cols + c])); }; then c=$((c - 1)); else r=$((r - 1)); fi
    path=("($r,$c)" "${path[@]}")
done
echo "cost ${dp[rows * cols - 1]} path ${path[*]}"
