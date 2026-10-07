#!/usr/bin/env bash
set -euo pipefail

hamming_str() {
    local a=$1 b=$2 d=0 i
    ((${#a} == ${#b})) || { echo "length mismatch" >&2; return 1; }
    for ((i = 0; i < ${#a}; i++)); do [[ ${a:i:1} != "${b:i:1}" ]] && d=$((d + 1)); done
    echo "$d"
}

popcount() { local x=$1 n=0; while ((x)); do x=$((x & (x - 1))); n=$((n + 1)); done; echo "$n"; }
hamming_int() { popcount $(($1 ^ $2)); }

# Sum of distances over all pairs, counting bit by bit.
total_pairwise() {
    local total=0 bit ones x
    for ((bit = 0; bit < 32; bit++)); do
        ones=0
        for x in "$@"; do (((x >> bit) & 1)) && ones=$((ones + 1)); done
        total=$((total + ones * ($# - ones)))
    done
    echo "$total"
}

echo "$(hamming_str karolin kathrin) $(hamming_str 1011101 1001001) $(hamming_int 1 4)"
echo "pairwise total for (4,14,2): $(total_pairwise 4 14 2)"
hamming_str abc ab || true
