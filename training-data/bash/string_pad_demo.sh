#!/usr/bin/env bash
set -euo pipefail

pad_left() {
    local s=$1 width=$2 ch=${3:- }
    while ((${#s} < width)); do s="$ch$s"; done
    printf '%s' "$s"
}

pad_right() {
    local s=$1 width=$2 ch=${3:- }
    while ((${#s} < width)); do s="$s$ch"; done
    printf '%s' "$s"
}

echo "[$(pad_left 42 6 0)]"
echo "[$(pad_right abc 6 .)]"
printf '[%-8s][%8s]\n' left right
printf '[%05d]\n' 42
