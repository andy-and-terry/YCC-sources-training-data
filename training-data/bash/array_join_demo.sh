#!/usr/bin/env bash
set -euo pipefail

join_by() {
    local delim=$1
    shift
    local IFS=$delim
    echo "$*"
}

fruits=(apple banana cherry)
echo "$(join_by ", " "${fruits[@]}")"
echo "$(join_by "-" "${fruits[@]}")"
