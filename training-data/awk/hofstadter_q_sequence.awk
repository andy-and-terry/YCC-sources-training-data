#!/usr/bin/awk -f
BEGIN {
    q[1] = 1; q[2] = 1
    out = "1 1"
    for (n = 3; n <= 20; n++) {
        q[n] = q[n - q[n - 1]] + q[n - q[n - 2]]
        out = out " " q[n]
    }
    print out
}
