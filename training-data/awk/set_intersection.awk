#!/usr/bin/awk -f
# Prints lines that appear in both input files (set intersection), given as two arguments.
FNR == NR {
    first[$0] = 1
    next
}
$0 in first {
    print
}
