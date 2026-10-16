#!/usr/bin/awk -f
# Input: row col value. Output: a pivot matrix.
{ rows[$1]; cols[$2]; v[$1, $2] += $3 }
END {
    printf "%-8s", ""
    for (c in cols) printf "%8s", c
    print ""
    for (r in rows) {
        printf "%-8s", r
        for (c in cols) printf "%8d", v[r, c]
        print ""
    }
}
