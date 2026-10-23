#!/usr/bin/env bash
set -euo pipefail

tmpfile=$(mktemp)
cleanup() {
    rm -f "$tmpfile"
    echo "cleaned up"
}
trap cleanup EXIT

echo "data" > "$tmpfile"
cat "$tmpfile"
echo "exists: $([[ -f $tmpfile ]] && echo yes || echo no)"
