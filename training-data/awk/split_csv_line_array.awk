#!/usr/bin/awk -f
BEGIN {
    n = split("a,b,c,d", parts, ",")
    for (i = n; i >= 1; i--)
        printf "%d:%s\n", i, parts[i]
}
