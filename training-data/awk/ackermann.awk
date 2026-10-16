#!/usr/bin/awk -f
function ack(m, n) {
    if (m == 0) return n + 1
    if (n == 0) return ack(m - 1, 1)
    return ack(m - 1, ack(m, n - 1))
}
BEGIN {
    for (m = 0; m <= 2; m++)
        for (n = 0; n <= 3; n++)
            printf "A(%d,%d)=%d\n", m, n, ack(m, n)
}
