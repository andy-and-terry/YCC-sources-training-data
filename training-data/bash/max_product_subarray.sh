#!/usr/bin/env bash
set -euo pipefail

max_product() {
    local best=$1 hi=$1 lo=$1 x t
    shift
    for x in "$@"; do
        if ((x < 0)); then t=$hi; hi=$lo; lo=$t; fi
        hi=$((x > hi * x ? x : hi * x))
        lo=$((x < lo * x ? x : lo * x))
        ((hi > best)) && best=$hi
    done
    echo "$best"
}

for a in "2 3 -2 4" "-2 0 -1" "-2 3 -4" "1 -2 -3 0 7 -8 -2"; do
    # shellcheck disable=SC2086
    printf '%-20s -> %d\n' "[$a]" "$(max_product $a)"
done
