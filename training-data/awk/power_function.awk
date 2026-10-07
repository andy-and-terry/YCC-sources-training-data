#!/usr/bin/awk -f
function power(base, n,    result, i) {
    result = 1
    for (i = 0; i < n; i++) {
        result *= base
    }
    return result
}
BEGIN {
    print power(2, 10)
    print power(3, 4)
}
