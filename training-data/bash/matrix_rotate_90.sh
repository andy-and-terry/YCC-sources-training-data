#!/usr/bin/env bash
set -euo pipefail

# Matrix is an array of space-separated rows; rotation is done with awk.
rotate_cw() {
    awk '{ for (j = 1; j <= NF; j++) m[NR, j] = $j; if (NF > c) c = NF }
         END { for (j = 1; j <= c; j++) { row = ""; for (i = NR; i >= 1; i--) row = row (i < NR ? " " : "") m[i, j]; print row } }'
}

rotate_ccw() {
    awk '{ for (j = 1; j <= NF; j++) m[NR, j] = $j; if (NF > c) c = NF }
         END { for (j = c; j >= 1; j--) { row = ""; for (i = 1; i <= NR; i++) row = row (i > 1 ? " " : "") m[i, j]; print row } }'
}

matrix=$'1 2 3\n4 5 6\n7 8 9'
echo "clockwise:"; rotate_cw <<<"$matrix"
echo "counter-clockwise:"; rotate_ccw <<<"$matrix"
echo "4 x cw == original: $([[ $(rotate_cw <<<"$matrix" | rotate_cw | rotate_cw | rotate_cw) == "$matrix" ]] && echo yes || echo no)"
