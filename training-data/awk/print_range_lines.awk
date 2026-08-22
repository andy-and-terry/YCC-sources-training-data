#!/usr/bin/awk -f
# Prints lines 2 through 4 (inclusive) of the input.
NR >= 2 && NR <= 4 { print }
