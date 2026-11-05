#!/usr/bin/env bash
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"; echo "cleaned $tmp"' EXIT
echo data > "$tmp/file"
cat "$tmp/file"
