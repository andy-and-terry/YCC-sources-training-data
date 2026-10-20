#!/usr/bin/env bash
set -euo pipefail

tmp=$(mktemp -d)
cleanup() { rm -rf "$tmp"; echo "cleaned"; }
trap cleanup EXIT
trap 'echo "error on line $LINENO" >&2' ERR
echo data > "$tmp/f"
cat "$tmp/f"
( false ) || echo "handled failure"
