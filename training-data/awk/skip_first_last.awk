#!/usr/bin/awk -f
# Prints all lines except the first and last.
NR > 1 { print prev }
{ prev = $0 }
