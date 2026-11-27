boolean isPrime(long n) {
    if (n < 2) return false
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return false
    true
}

def out = []
for (long y = 1; out.size() < 8; y++) {
    long p = 3 * y * y + 3 * y + 1
    if (isPrime(p)) out << p
}
println out
