#!/usr/bin/awk -f
function popcount(n,    c) {
    while (n > 0) { c += n % 2; n = int(n / 2) }
    return c
}
BEGIN { print popcount(183), popcount(255), popcount(0) }
