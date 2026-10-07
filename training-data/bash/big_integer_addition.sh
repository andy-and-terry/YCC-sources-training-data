#!/usr/bin/env bash
set -euo pipefail

# Adds two arbitrarily long non-negative decimal strings.
add_big() {
    local a=$1 b=$2 carry=0 out='' i j s
    i=$((${#a} - 1)); j=$((${#b} - 1))
    while ((i >= 0 || j >= 0 || carry)); do
        s=$carry
        ((i >= 0)) && s=$((s + ${a:i:1}))
        ((j >= 0)) && s=$((s + ${b:j:1}))
        out=$((s % 10))$out
        carry=$((s / 10))
        ((i--, j--)) || true
    done
    echo "$out"
}

# Multiplies a big decimal string by a small integer.
mul_small() {
    local a=$1 k=$2 carry=0 out='' i p
    for ((i = ${#a} - 1; i >= 0; i--)); do
        p=$((${a:i:1} * k + carry))
        out=$((p % 10))$out
        carry=$((p / 10))
    done
    while ((carry)); do out=$((carry % 10))$out; carry=$((carry / 10)); done
    echo "$out"
}

f=1
for ((n = 2; n <= 25; n++)); do f=$(mul_small "$f" "$n"); done
echo "25! = $f"
echo "$(add_big 99999999999999999999 1)"
echo "$(add_big 123456789123456789 987654321987654321)"
