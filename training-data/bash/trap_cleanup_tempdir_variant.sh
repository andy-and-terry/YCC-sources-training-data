#!/usr/bin/env bash
set -euo pipefail

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"; echo "cleaned $tmp" >/dev/null' EXIT

echo "data" > "$tmp/file"
cat "$tmp/file"
