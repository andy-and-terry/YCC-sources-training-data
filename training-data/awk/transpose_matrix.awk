#!/usr/bin/awk -f
# Transposes a matrix given as whitespace-separated rows.
{
    for (c = 1; c <= NF; c++) {
        matrix[NR, c] = $c
    }
    if (NF > max_cols) max_cols = NF
}
END {
    for (c = 1; c <= max_cols; c++) {
        line = matrix[1, c]
        for (r = 2; r <= NR; r++) {
            line = line " " matrix[r, c]
        }
        print line
    }
}
