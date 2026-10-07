#!/usr/bin/awk -f
function fib(n) {
    if (n in memo) return memo[n]
    if (n < 2) return memo[n] = n
    return memo[n] = fib(n - 1) + fib(n - 2)
}
BEGIN {
    for (i = 0; i <= 50; i += 10)
        printf "fib(%d) = %d\n", i, fib(i)
}
