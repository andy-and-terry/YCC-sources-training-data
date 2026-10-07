#!/usr/bin/env bash
set -euo pipefail

# Floor square root via integer Newton iteration.
isqrt() {
    local n=$1 x y
    ((n < 2)) && { echo "$n"; return; }
    x=$n; y=$((x / 2 + (x & 1))) # ceil(n/2) without overflow
    while ((y < x)); do x=$y; y=$(((y + n / y) / 2)); done
    echo "$x"
}

# Bisection, with the upper bound capped so mid*mid never overflows.
isqrt_bisect() {
    local n=$1 lo=0 hi mid
    hi=$((n < 3037000499 ? n : 3037000499))
    while ((lo < hi)); do
        mid=$(((lo + hi + 1) / 2))
        if ((mid * mid <= n)); then lo=$mid; else hi=$((mid - 1)); fi
    done
    echo "$lo"
}

for n in 0 1 15 16 17 99 1000000 9223372036854775807; do
    printf '%-20s isqrt=%-11s bisect=%s\n' "$n" "$(isqrt "$n")" "$(isqrt_bisect "$n")"
done
