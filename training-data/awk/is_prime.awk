#!/usr/bin/awk -f
# Reads numbers from stdin and prints only the prime ones.
function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) {
        if (n % i == 0) return 0
    }
    return 1
}
{
    if (is_prime($1)) {
        print $1
    }
}
