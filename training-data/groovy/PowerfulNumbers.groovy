boolean isPowerful(int n) {
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return false
            while (n % p == 0) n = n.intdiv(p)
        }
    }
    n == 1
}

println((1..100).findAll { isPowerful(it) }.join(' '))
