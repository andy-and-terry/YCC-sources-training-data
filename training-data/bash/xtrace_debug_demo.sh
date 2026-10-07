#!/usr/bin/env bash
set -euo pipefail

add() {
    local a=$1
    local b=$2
    echo $((a + b))
}

set -x
result=$(add 2 3)
set +x

echo "result=$result"
