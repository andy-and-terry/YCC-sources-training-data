#!/usr/bin/awk -f
# Usage: awk -v n=3 -f first_n_lines.awk file
BEGIN { if (n == "") n = 5 }
NR > n { exit }
{ print }
