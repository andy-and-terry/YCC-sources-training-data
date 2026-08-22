#!/usr/bin/awk -f
function factorial(n,    result, i) {
    result = 1
    for (i = 2; i <= n; i++) result *= i
    return result
}
BEGIN {
    for (n = 0; n <= 10; n++) {
        printf "%d ", factorial(n)
    }
    print ""
}
