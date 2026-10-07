#!/usr/bin/env bash
# mktemp with an EXIT trap guaranteeing cleanup.
set -euo pipefail
tmp=$(mktemp)
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmp" "$tmpdir"; echo "cleaned up"' EXIT
echo "data" > "$tmp"
touch "$tmpdir/a" "$tmpdir/b"
echo "file: $(cat "$tmp"), dir entries: $(ls "$tmpdir" | wc -l)"
