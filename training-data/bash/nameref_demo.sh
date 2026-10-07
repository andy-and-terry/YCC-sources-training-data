#!/usr/bin/env bash
set -euo pipefail

increment() {
    local -n counter_ref=$1
    counter_ref=$((counter_ref + 1))
}

count=10
increment count
increment count
echo "$count"
