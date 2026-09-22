#!/usr/bin/env bash
set -euo pipefail

factorial() {
    local n=$1
    if ((n <= 1)); then
        echo 1
        return
    fi
    local sub
    sub=$(factorial $((n - 1)))
    echo $((n * sub))
}

echo "$(factorial 5)"
echo "$(factorial 0)"
