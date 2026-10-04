#!/usr/bin/awk -f
BEGIN {
    rows = 6
    for (i = 0; i < rows; i++) {
        row[i, 0] = 1
        line = "1"
        for (j = 1; j <= i; j++) {
            row[i, j] = row[i - 1, j - 1] + (j < i ? row[i - 1, j] : 0)
            line = line " " row[i, j]
        }
        print line
    }
}
