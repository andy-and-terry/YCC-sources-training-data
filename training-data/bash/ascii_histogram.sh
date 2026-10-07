#!/usr/bin/env bash
set -euo pipefail

width=30
text=${1:-theraininspainfallsmainlyontheplain}
counts=$(fold -w1 <<<"$text" | sort | uniq -c)
peak=$(awk '{ if ($1 > m) m = $1 } END { print m }' <<<"$counts")

while read -r n ch; do
  bar=$((n * width / peak))
  ((bar < 1)) && bar=1
  printf '%s | %s %d\n' "$ch" "$(printf '#%.0s' $(seq "$bar"))" "$n"
done <<<"$counts"
