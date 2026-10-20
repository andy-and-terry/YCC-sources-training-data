#!/usr/bin/env bash
set -euo pipefail

words="b a c a b a"
echo $words | tr ' ' '\n' | sort | uniq -c | sort -rn
printf '10\n9\n100\n' | sort -n | tr '\n' ' '; echo
printf 'b 2\na 2\nc 1\n' | sort -k2,2nr -k1,1
printf 'x\ny\nx\n' | sort -u | paste -sd,
printf '1\n2\n3\n4\n' | awk '{s+=$1} END{print s, s/NR}'
