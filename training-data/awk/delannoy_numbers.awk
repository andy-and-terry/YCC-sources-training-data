#!/usr/bin/awk -f
BEGIN {
    size = 10
    for (m = 0; m < size; m++)
        for (n = 0; n < size; n++)
            d[m, n] = (m == 0 || n == 0) ? 1 : d[m - 1, n] + d[m, n - 1] + d[m - 1, n - 1]
    out = d[0, 0]
    for (i = 1; i < size; i++)
        out = out " " d[i, i]
    print out
}
