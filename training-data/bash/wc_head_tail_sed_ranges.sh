#!/usr/bin/env bash
set -euo pipefail

f=$(mktemp); trap 'rm -f "$f"' EXIT
seq 1 20 > "$f"
head -n 3 "$f" | tr '\n' ' '; echo
tail -n +18 "$f" | tr '\n' ' '; echo
sed -n '5,7p;$p' "$f" | tr '\n' ' '; echo
sed '1~5d' "$f" | wc -l
awk 'NR%5==0' "$f" | paste -sd+ | bc
