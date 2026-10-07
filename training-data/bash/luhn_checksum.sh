#!/usr/bin/env bash
set -euo pipefail

luhn_sum() {
    local s=$1 sum=0 i d pos=0
    for ((i = ${#s} - 1; i >= 0; i--, pos++)); do
        d=${s:i:1}
        if ((pos % 2)); then d=$((d * 2)); ((d > 9)) && d=$((d - 9)); fi
        sum=$((sum + d))
    done
    echo "$sum"
}

luhn_valid() {
    local s=${1// /}
    [[ $s =~ ^[0-9]{2,}$ ]] && (($(luhn_sum "$s") % 10 == 0)) && echo 1 || echo 0
}

check_digit() { echo $(((10 - $(luhn_sum "${1}0") % 10) % 10)); }

echo "$(luhn_valid '4539 3195 0343 6467') $(luhn_valid '8273 1232 7352 0569') $(luhn_valid 12a4)"
echo "check digit for 7992739871: $(check_digit 7992739871)"
