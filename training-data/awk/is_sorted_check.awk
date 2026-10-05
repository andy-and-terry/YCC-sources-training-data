#!/usr/bin/awk -f
# Report whether the first column is in non-decreasing numeric order.
NR > 1 && $1 < prev {
    printf "line %d out of order: %s < %s\n", NR, $1, prev
    bad = 1
}
{ prev = $1 }
END { print bad ? "not sorted" : "sorted" }
