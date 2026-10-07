#!/usr/bin/awk -f
# Prints the longest line of input along with its line number and length.
length($0) > max {
    max = length($0)
    best = $0
    where = NR
}
END {
    if (NR > 0)
        printf "line %d (%d chars): %s\n", where, max, best
}
