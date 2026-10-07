#!/usr/bin/env bash
set -euo pipefail

matrix=$'0 1 2 0\n3 4 5 2\n1 3 1 5'

# Two passes over the input: record zero rows/columns, then rewrite.
awk 'NR == FNR { for (j = 1; j <= NF; j++) if ($j == 0) { zr[NR] = 1; zc[j] = 1 }; next }
     { for (j = 1; j <= NF; j++) if ((FNR in zr) || (j in zc)) $j = 0; print }' \
    <(echo "$matrix") <(echo "$matrix")
