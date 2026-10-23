#!/usr/bin/awk -f
BEGIN {
    p = 1
    for (n = 1; n <= 10; n++) {
        p *= 2
        out = out (n > 1 ? " " : "") sprintf("%d", n * p - 1)
    }
    print out
}
