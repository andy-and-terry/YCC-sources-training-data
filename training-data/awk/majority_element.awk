#!/usr/bin/awk -f
# Boyer-Moore majority vote over column 1
{
    if (count == 0) { cand = $1; count = 1 }
    else if ($1 == cand) count++
    else count--
    a[NR] = $1
}
END {
    for (i = 1; i <= NR; i++) if (a[i] == cand) c++
    if (c > NR / 2) print "majority:", cand
    else print "no majority"
}
