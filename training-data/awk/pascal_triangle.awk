#!/usr/bin/awk -f
BEGIN {
    rows = 6
    row[0] = 1
    n = 1
    for (r = 1; r <= rows; r++) {
        line = ""
        for (i = 0; i < n; i++) line = line (i ? " " : "") row[i]
        print line
        for (i = n; i >= 1; i--) row[i] = row[i] + (i < n ? row[i - 1] : 0)
        row[n] = 1
        n++
    }
}
