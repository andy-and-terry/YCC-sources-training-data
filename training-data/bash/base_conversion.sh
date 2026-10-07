#!/usr/bin/env bash
set -euo pipefail

DIGITS=0123456789abcdefghijklmnopqrstuvwxyz

to_base() {
    local n=$1 b=$2 s='' neg=''
    ((n == 0)) && { echo 0; return; }
    ((n < 0)) && { neg='-'; n=$((-n)); }
    while ((n > 0)); do
        s=${DIGITS:n % b:1}$s
        n=$((n / b))
    done
    echo "$neg$s"
}

from_base() {
    local s=${1,,} b=$2 n=0 neg=1 c d i
    [[ $s == -* ]] && { neg=-1; s=${s#-}; }
    for ((i = 0; i < ${#s}; i++)); do
        c=${s:i:1}
        d=${DIGITS%%"$c"*}; d=${#d}
        ((d < b)) || { echo "bad digit $c" >&2; return 1; }
        n=$((n * b + d))
    done
    echo $((neg * n))
}

for pair in "255 2" "255 16" "-42 7" "123456789 36"; do
    read -r n b <<<"$pair"
    s=$(to_base "$n" "$b")
    back=$(from_base "$s" "$b")
    echo "$n base $b = $s (roundtrip $([[ $back == "$n" ]] && echo ok || echo FAIL))"
done
# bash also parses base#digits natively
echo "builtin: $((2#11111111)) $((16#ff)) $((36#21i3v9))"
