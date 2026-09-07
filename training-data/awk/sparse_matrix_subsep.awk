#!/usr/bin/awk -f
# Stores only non-zero entries using a 2D associative array keyed by SUBSEP.
BEGIN {
    rows = 4
    cols = 4
    matrix[0, 1] = 5
    matrix[1, 3] = 8
    matrix[2, 2] = 3
    matrix[3, 0] = 9

    for (r = 0; r < rows; r++) {
        for (c = 0; c < cols; c++) {
            key = r SUBSEP c
            if (key in matrix) {
                printf "%d ", matrix[key]
            } else {
                printf "0 "
            }
        }
        print ""
    }
}
