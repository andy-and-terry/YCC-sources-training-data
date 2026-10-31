boolean isSphenic(int n) {
    int distinct = 0
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n = n.intdiv(p)
            if (n % p == 0) return false
            distinct++
        }
    }
    distinct + (n > 1 ? 1 : 0) == 3
}

println((2..<80).findAll { isSphenic(it) })
