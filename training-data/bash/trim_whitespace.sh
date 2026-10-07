#!/usr/bin/env bash
set -euo pipefail

trim() {
    local s=$1
    s="${s#"${s%%[![:space:]]*}"}"
    s="${s%"${s##*[![:space:]]}"}"
    echo "$s"
}

echo "[$(trim "   padded text   ")]"
echo "[$(trim "no padding")]"
