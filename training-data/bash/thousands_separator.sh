#!/usr/bin/env bash
set -euo pipefail

add_thousands_separator() {
    local n=$1
    printf "%'d\n" "$n" 2>/dev/null && return
    # Fallback if the locale doesn't support the %'d grouping flag.
    local reversed="" i digits=$n
    digits=${digits//-/}
    for ((i = ${#digits}; i > 0; i -= 3)); do
        local start=$((i - 3))
        ((start < 0)) && start=0
        reversed="${digits:start:i-start},$reversed"
    done
    echo "${reversed%,}"
}

add_thousands_separator 1234567
add_thousands_separator 999
