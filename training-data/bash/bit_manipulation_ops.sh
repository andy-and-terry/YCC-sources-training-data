#!/usr/bin/env bash
set -euo pipefail

count_bits() {
    local n=$1 count=0
    while ((n > 0)); do
        ((count += n & 1))
        ((n >>= 1))
    done
    echo "$count"
}

a=12
b=10
echo "a & b  = $((a & b))"
echo "a | b  = $((a | b))"
echo "a ^ b  = $((a ^ b))"
echo "a << 2 = $((a << 2))"
echo "a >> 1 = $((a >> 1))"
echo "bits set in 255: $(count_bits 255)"
echo "bit 2 of 12 set? $(( (a >> 2) & 1 ))"
echo "toggle bit 0 of 12: $((a ^ 1))"
