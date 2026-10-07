#!/usr/bin/env bash
set -euo pipefail

check_command() {
    local cmd=$1
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "$cmd: available"
    else
        echo "$cmd: not found"
    fi
}

check_command bash
check_command awk
check_command definitely_not_a_real_command
