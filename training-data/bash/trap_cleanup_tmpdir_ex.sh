#!/usr/bin/env bash
set -euo pipefail
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"; echo "cleaned $tmp" >&2' EXIT
echo data > "$tmp/file"
cat "$tmp/file"
