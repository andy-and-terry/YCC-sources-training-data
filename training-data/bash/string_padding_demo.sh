#!/usr/bin/env bash
set -euo pipefail

pad_left() {
    local str=$1 width=$2 ch=${3:- }
    while ((${#str} < width)); do
        str="$ch$str"
    done
    echo "$str"
}

pad_right() {
    printf '%-*s|\n' "$2" "$1"
}

pad_left 42 6 0
pad_left abc 8 '*'
pad_right name 10
printf '%05d\n' 42
printf '%8.3f\n' 3.14159
printf '%-8s|%8s|\n' left right
