#!/usr/bin/awk -f
BEGIN {
    rows = 3; cols = 4
    for (r = 1; r <= rows; r++) for (c = 1; c <= cols; c++) m[r, c] = (r - 1) * cols + c
    for (c = 1; c <= cols; c++) {
        line = ""
        for (r = 1; r <= rows; r++) line = line (r > 1 ? " " : "") m[r, c]
        print line
    }
    for (r = 1; r <= rows; r++) { s = 0; for (c = 1; c <= cols; c++) s += m[r, c]; print "row", r, "sum", s }
    d = 0; for (i = 1; i <= 3; i++) d += m[i, i]; print "trace3", d
}
