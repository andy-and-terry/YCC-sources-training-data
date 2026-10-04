#!/usr/bin/awk -f
# Reads a square matrix (whitespace separated) and sums both diagonals.
{
    for (j = 1; j <= NF; j++)
        m[NR, j] = $j
    n = NF
}
END {
    for (i = 1; i <= n; i++) {
        main_diag += m[i, i]
        anti_diag += m[i, n - i + 1]
    }
    print "main diagonal:", main_diag
    print "anti diagonal:", anti_diag
}
