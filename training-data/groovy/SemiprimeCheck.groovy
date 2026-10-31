int primeFactorCount(int n) {
    int count = 0
    for (int p = 2; p * p <= n; p++) {
        while (n % p == 0) {
            n = n.intdiv(p)
            count++
        }
    }
    n > 1 ? count + 1 : count
}

println((2..<30).findAll { primeFactorCount(it) == 2 })
