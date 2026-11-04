# Reads matrix rows from stdin (space-separated); prints whether the matrix is Toeplitz.
{
    for (j = 1; j <= NF; j++) m[NR, j] = $j
    cols = NF
}
END {
    ok = 1
    for (i = 2; i <= NR && ok; i++)
        for (j = 2; j <= cols; j++)
            if (m[i, j] != m[i-1, j-1]) { ok = 0; break }
    print (ok ? "true" : "false")
}
# try: printf '1 2 3\n4 1 2\n5 4 1\n' | awk -f toeplitz_check.awk
