#!/usr/bin/env bash
set -euo pipefail

factorize() {
    local n=$1
    local factor=2
    local factors=()

    while ((factor * factor <= n)); do
        while ((n % factor == 0)); do
            factors+=("$factor")
            n=$((n / factor))
        done
        factor=$((factor + 1))
    done
    if ((n > 1)); then
        factors+=("$n")
    fi

    echo "${factors[@]}"
}

factorize 360
factorize 97
factorize 84
