#!/usr/bin/awk -f
function proper_divisor_sum(n,    sum, d) {
    sum = 0
    for (d = 1; d <= int(n / 2); d++)
        if (n % d == 0)
            sum += d
    return sum
}

BEGIN {
    n = 12
    out = n
    while (n != 0) {
        n = proper_divisor_sum(n)
        out = out " " n
    }
    print out
}
