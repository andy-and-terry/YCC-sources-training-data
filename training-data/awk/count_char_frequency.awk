#!/usr/bin/awk -f
{
    n = length($0)
    for (i = 1; i <= n; i++) {
        c = substr($0, i, 1)
        if (c != " ") freq[c]++
    }
}
END {
    for (c in freq)
        printf "%s %d\n", c, freq[c] | "sort"
    close("sort")
}
