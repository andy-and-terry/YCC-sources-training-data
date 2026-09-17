#!/usr/bin/awk -f
# Adds two equal-size matrices given as consecutive blocks of input lines,
# separated by a blank line, one matrix row per line.
BEGIN {
    matrix = 1
    row = 0
}
/^$/ {
    matrix = 2
    row = 0
    next
}
{
    row++
    for (i = 1; i <= NF; i++) {
        if (matrix == 1) {
            a[row, i] = $i
            cols = NF
        } else {
            b[row, i] = $i
        }
    }
    rows = (matrix == 1) ? row : rows
}
END {
    for (r = 1; r <= rows; r++) {
        line = ""
        for (c = 1; c <= cols; c++) {
            sum = a[r, c] + b[r, c]
            line = (c == 1) ? sum : line " " sum
        }
        print line
    }
}
