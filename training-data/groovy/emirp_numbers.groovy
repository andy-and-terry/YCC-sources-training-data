// Emirps: primes whose digit reversal is a different prime.
boolean isPrime(int n) {
    if (n < 2) return false
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return false
    true
}

def emirps = (2..<200).findAll { n ->
    int r = n.toString().reverse().toInteger()
    r != n && isPrime(n) && isPrime(r)
}
println emirps.join(' ')
