#!/usr/bin/env bash
# Sum each column of whitespace-separated numeric input.
awk '{ for (i = 1; i <= NF; i++) s[i] += $i; if (NF > n) n = NF }
     END { for (i = 1; i <= n; i++) printf "col %d: %d\n", i, s[i] }' <<'DATA'
1 2 3
4 5 6
7 8 9
DATA
