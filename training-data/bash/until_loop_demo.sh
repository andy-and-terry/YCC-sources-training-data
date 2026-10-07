#!/usr/bin/env bash
set -euo pipefail

# `until` runs its body while the condition stays false, the mirror
# image of `while`.
count=0
until ((count >= 5)); do
    echo "count is $count"
    count=$((count + 1))
done
echo "done"
