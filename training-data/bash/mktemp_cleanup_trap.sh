#!/usr/bin/env bash
set -euo pipefail

# Create a temp dir and guarantee its removal on any exit.
tmpdir=$(mktemp -d)
cleanup() { rm -rf "$tmpdir"; echo "cleaned up"; }
trap cleanup EXIT

echo "hello" > "$tmpdir/file.txt"
echo "working in a temp dir with $(ls "$tmpdir" | wc -l) file"
cat "$tmpdir/file.txt"
