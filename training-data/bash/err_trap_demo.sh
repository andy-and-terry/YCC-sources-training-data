#!/usr/bin/env bash
set -euo pipefail

on_error() {
    echo "error on line $1: command '$2' exited with status $3"
}

trap 'on_error "$LINENO" "$BASH_COMMAND" "$?"' ERR

risky_step() {
    local should_fail=$1
    if [[ "$should_fail" == "yes" ]]; then
        return 1
    fi
    echo "risky_step ok"
}

risky_step no

set +e
risky_step yes
set -e

echo "script continued after handled error"
