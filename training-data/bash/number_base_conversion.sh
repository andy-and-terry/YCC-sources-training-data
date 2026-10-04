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

n=255
echo "decimal $n"
echo "binary   $(to_base "$n" 2)"
echo "octal    $(to_base "$n" 8)"
echo "hex      $(to_base "$n" 16)"
echo "from hex FF  -> $((16#FF))"
echo "from bin 1010 -> $((2#1010))"
echo "from oct 777 -> $((8#777))"
