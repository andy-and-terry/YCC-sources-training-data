#!/usr/bin/env bash
set -euo pipefail

sum_digits() {
    local n=$1
    local sum=0
    while ((n > 0)); do
        sum=$((sum + n % 10))
        n=$((n / 10))
    done
    echo "$sum"
}

sum_digits 12345
