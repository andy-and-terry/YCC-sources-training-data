#!/usr/bin/env bash
set -euo pipefail

unique() {
    declare -A seen=()
    local x
    for x in "$@"; do
        if [[ -z ${seen[$x]:-} ]]; then
            seen[$x]=1
            printf '%s\n' "$x"
        fi
    done
}

items=(pear apple pear fig apple kiwi)
mapfile -t result < <(unique "${items[@]}")
echo "original: ${items[*]}"
echo "unique:   ${result[*]}"
