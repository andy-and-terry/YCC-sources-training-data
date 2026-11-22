// Sophie Germain primes: p prime and 2p + 1 prime.
boolean isPrime(int n) {
    if (n < 2) return false
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return false
    true
}

println (2..<100).findAll { isPrime(it) && isPrime(2 * it + 1) }.join(' ')
