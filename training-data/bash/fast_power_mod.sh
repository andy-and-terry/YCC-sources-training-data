#!/usr/bin/env bash
set -euo pipefail

# Square-and-multiply. With m < 2^31 every product fits in 63-bit arithmetic.
power_mod() {
    local base=$(($1 % $3)) exp=$2 m=$3 r=1
    while ((exp > 0)); do
        ((exp & 1)) && r=$((r * base % m))
        base=$((base * base % m))
        exp=$((exp >> 1))
    done
    echo $((r % m))
}

P=1000000007
echo "2^10 mod 1000 = $(power_mod 2 10 1000)"
echo "3^200 mod p = $(power_mod 3 200 "$P") (bc: $(echo "3^200 % $P" | bc))"
inv=$(power_mod 12345 $((P - 2)) "$P")
echo "inverse of 12345 mod p = $inv, check: $((12345 * inv % P))"
