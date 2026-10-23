#!/usr/bin/env bash
set -euo pipefail

# A RETURN trap set inside a function runs when that function returns.
process() {
    trap 'echo "process: cleanup"; trap - RETURN' RETURN
    echo "process: working on $1"
    return 0
}

process "data.txt"
echo "after process"
