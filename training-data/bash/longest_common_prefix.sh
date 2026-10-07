#!/usr/bin/env bash
set -euo pipefail

longest_common_prefix() {
    local prefix=$1
    shift
    local word
    for word in "$@"; do
        while [[ "$word" != "$prefix"* ]]; do
            prefix=${prefix%?}
            [[ -z "$prefix" ]] && break
        done
    done
    echo "$prefix"
}

echo "[$(longest_common_prefix flower flow flight)]"
echo "[$(longest_common_prefix interview internet interval)]"
echo "[$(longest_common_prefix dog racecar car)]"
