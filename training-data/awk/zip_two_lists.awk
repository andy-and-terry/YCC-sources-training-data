#!/usr/bin/awk -f
# Pair elements of two space-separated lists
BEGIN {
    n = split("a b c", x, " ")
    split("1 2 3", y, " ")
    for (i = 1; i <= n; i++) print x[i] "=" y[i]
}
