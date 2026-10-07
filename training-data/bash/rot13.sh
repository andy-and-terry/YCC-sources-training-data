#!/usr/bin/env bash
set -euo pipefail

rot13() { tr 'A-Za-z' 'N-ZA-Mn-za-m' <<<"$1"; }

# General Caesar shift built from rotated alphabets.
caesar() {
    local s=$1 k=$(((${2} % 26 + 26) % 26))
    local lower=abcdefghijklmnopqrstuvwxyz upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
    tr "$lower$upper" "${lower:k}${lower:0:k}${upper:k}${upper:0:k}" <<<"$s"
}

msg='Why did the chicken cross the road?'
enc=$(rot13 "$msg")
echo "$enc"
echo "roundtrip=$([[ $(rot13 "$enc") == "$msg" ]] && echo 1 || echo 0) caesar13=$([[ $(caesar "$msg" 13) == "$enc" ]] && echo 1 || echo 0) caesar(-3)=$(caesar 'abc XYZ' -3)"
