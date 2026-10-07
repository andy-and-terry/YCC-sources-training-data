#!/usr/bin/awk -f
# Transposes a whitespace-separated matrix given as input rows.
{
    for (col = 1; col <= NF; col++) {
        cell[NR, col] = $col
    }
    if (NF > max_cols) max_cols = NF
    max_rows = NR
}
END {
    for (col = 1; col <= max_cols; col++) {
        line = cell[1, col]
        for (row = 2; row <= max_rows; row++) {
            line = line " " cell[row, col]
        }
        print line
    }
}
