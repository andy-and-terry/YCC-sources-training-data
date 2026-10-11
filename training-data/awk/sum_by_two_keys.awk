#!/usr/bin/awk -f
# Aggregate by composite key using SUBSEP and split it back
{ t[$1, $2] += $3 }
END {
    for (k in t) {
        split(k, p, SUBSEP)
        printf "%s/%s: %d\n", p[1], p[2], t[k]
    }
}
