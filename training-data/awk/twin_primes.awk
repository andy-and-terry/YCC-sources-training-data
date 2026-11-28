#!/usr/bin/awk -f
BEGIN {
    n = 50
    for (i = 2; i * i <= n; i++)
        if (!composite[i]) for (j = i * i; j <= n; j += i) composite[j] = 1
    for (p = 3; p + 2 <= n; p++)
        if (!composite[p] && !composite[p + 2]) printf "(%d, %d) ", p, p + 2
    print ""
}
