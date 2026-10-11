#!/usr/bin/awk -f
# Number of trailing zeros in n! is the sum of floor(n/5^k)
function tz(n,   c) {
    while (n >= 5) { n = int(n / 5); c += n }
    return c + 0
}
BEGIN { print tz(5), tz(25), tz(100) }
