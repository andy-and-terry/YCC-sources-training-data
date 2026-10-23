#!/usr/bin/awk -f
BEGIN {
    n = 100
    fib[0] = 1; fib[1] = 2
    k = 1
    while (fib[k] <= n) {
        k++
        fib[k] = fib[k - 1] + fib[k - 2]
    }
    for (i = k; i >= 0; i--)
        if (fib[i] <= n) {
            out = out (out == "" ? "" : " ") fib[i]
            n -= fib[i]
        }
    print out
}
