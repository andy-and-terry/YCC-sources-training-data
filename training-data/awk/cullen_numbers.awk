#!/usr/bin/awk -f
BEGIN {
    p = 1
    for (n = 0; n <= 9; n++) {
        out = out (n ? " " : "") sprintf("%d", n * p + 1)
        p *= 2
    }
    print out
}
