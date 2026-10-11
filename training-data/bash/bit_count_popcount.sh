#!/usr/bin/env bash
# Population count using Kernighan's trick.
popcount() {
    local n=$1 c=0
    while (( n )); do
        (( n &= n - 1, c++ ))
    done
    echo "$c"
}
for v in 0 1 7 255 1024 65535; do
    echo "popcount($v) = $(popcount "$v")"
done
