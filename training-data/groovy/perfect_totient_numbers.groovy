// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
int phi(int n) { (1..n).count { (it as BigInteger).gcd(n as BigInteger) == 1G } }

boolean isPerfectTotient(int n) {
    int total = 0
    int m = n
    while (m > 1) {
        m = phi(m)
        total += m
    }
    total == n
}

println((2..<200).findAll { isPerfectTotient(it) }.join(' '))
