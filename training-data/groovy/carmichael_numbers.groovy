// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
boolean isPrime(int n) { n > 1 && (2..Math.sqrt(n) as int).every { n % it != 0 || it == n } }

boolean isCarmichael(int n) {
    if (isPrime(n)) return false
    def m = n as BigInteger
    (2..<n).every { a ->
        def b = a as BigInteger
        b.gcd(m) != 1G || b.modPow(m - 1, m) == 1G
    }
}

println((3..<3000).step(2).findAll { isCarmichael(it) }.join(' '))
