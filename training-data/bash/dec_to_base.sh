#!/usr/bin/env bash
set -euo pipefail

to_base() {
    local n=$1 base=$2 digits=0123456789ABCDEF out=""
    ((n == 0)) && { echo 0; return; }
    while ((n > 0)); do
        out="${digits:n % base:1}$out"
        ((n /= base))
    done
    echo "$out"
}

for n in 0 10 255 1024; do
    echo "$n: bin=$(to_base "$n" 2) oct=$(to_base "$n" 8) hex=$(to_base "$n" 16)"
done
