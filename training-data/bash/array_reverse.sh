#!/usr/bin/env bash
set -euo pipefail

reverse_array() {
    local -n src=$1
    local -a result=()
    local i
    for ((i = ${#src[@]} - 1; i >= 0; i--)); do
        result+=("${src[i]}")
    done
    echo "${result[@]}"
}

numbers=(1 2 3 4 5)
reverse_array numbers
