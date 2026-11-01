// Sum of prime factors counted with multiplicity.
int sopfr(int n) {
    int total = 0
    for (int p = 2; p * p <= n; p++) {
        while (n % p == 0) { total += p; n = n.intdiv(p) }
    }
    return total + (n > 1 ? n : 0)
}

println((2..<110).findAll { sopfr(it) == sopfr(it + 1) }.join(' '))
