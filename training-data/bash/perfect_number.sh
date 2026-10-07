#!/usr/bin/env bash
set -euo pipefail

divisor_sum() {
    local n=$1 sum=1 i
    ((n < 2)) && { echo 0; return; }
    for ((i = 2; i * i <= n; i++)); do
        if ((n % i == 0)); then
            sum=$((sum + i))
            ((i != n / i)) && sum=$((sum + n / i))
        fi
    done
    echo "$sum"
}

classify() {
    local s
    s=$(divisor_sum "$1")
    if ((s == $1)); then echo perfect; elif ((s > $1)); then echo abundant; else echo deficient; fi
}

# 8128 is the fourth; search up to 10000.
perfect=()
for ((n = 2; n < 10000; n++)); do
    s=1
    for ((i = 2; i * i <= n; i++)); do ((n % i == 0)) && s=$((s + i + (i * i != n ? n / i : 0))); done
    ((s == n)) && perfect+=("$n")
done
echo "perfect < 10000: ${perfect[*]}"
for n in 12 28 35; do echo "$n is $(classify "$n")"; done
