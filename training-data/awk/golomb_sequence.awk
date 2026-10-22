#!/usr/bin/awk -f
BEGIN {
    g[1] = 1
    out = "1"
    for (n = 2; n <= 20; n++) {
        g[n] = 1 + g[n - g[g[n - 1]]]
        out = out " " g[n]
    }
    print out
}
