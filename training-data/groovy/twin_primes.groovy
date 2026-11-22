// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
boolean isPrime(int n) {
    if (n < 2) return false
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return false
    true
}

println (2..<100).findAll { isPrime(it) && isPrime(it + 2) }.join(' ')
