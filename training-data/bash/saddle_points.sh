#!/usr/bin/env bash
set -euo pipefail

matrix=$'9 8 7\n5 3 2\n6 6 7'

awk '
{ for (c = 1; c <= NF; c++) m[NR, c] = $c; cols = NF }
END {
  for (c = 1; c <= cols; c++) { mn[c] = m[1, c]; for (r = 2; r <= NR; r++) if (m[r, c] < mn[c]) mn[c] = m[r, c] }
  for (r = 1; r <= NR; r++) {
    mx = m[r, 1]; for (c = 2; c <= cols; c++) if (m[r, c] > mx) mx = m[r, c]
    for (c = 1; c <= cols; c++) if (m[r, c] == mx && m[r, c] == mn[c]) printf "saddle at (%d,%d)\n", r, c
  }
}' <<<"$matrix"
