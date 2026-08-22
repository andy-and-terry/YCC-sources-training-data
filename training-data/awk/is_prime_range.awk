#!/usr/bin/awk -f
function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) {
        if (n % i == 0) return 0
    }
    return 1
}
BEGIN {
    for (n = 2; n <= 30; n++) {
        if (is_prime(n)) printf "%d ", n
    }
    print ""
}
