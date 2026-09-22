#!/usr/bin/env bash
set -euo pipefail

# Sequence expansion: numeric and zero-padded ranges.
echo "numbers:"
printf '  %s\n' {1..5}

echo "padded:"
printf '  %s\n' {01..05}

echo "letters:"
printf '  %s\n' {a..e}

# Step expansion.
echo "evens:"
printf '  %s\n' {0..10..2}

# List expansion, useful for building filenames or flags.
echo "files:"
printf '  %s\n' file{1,2,3}.txt

# Combined/nested expansion generates the cartesian product.
echo "combo:"
printf '  %s\n' {a,b}{1,2}

# Common real-world use: creating a directory tree in one command.
workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT
mkdir -p "$workdir"/{src,bin,docs}/{en,es}
echo "tree:"
find "$workdir" -mindepth 1 -type d | sed "s|$workdir/||" | sort
