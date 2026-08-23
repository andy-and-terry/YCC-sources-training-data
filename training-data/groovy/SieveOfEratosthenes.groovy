def sieve(limit) {
    def isComposite = new boolean[limit + 1]
    for (int i = 2; (long) i * i <= limit; i++) {
        if (!isComposite[i]) {
            for (int j = i * i; j <= limit; j += i) {
                isComposite[j] = true
            }
        }
    }
    return (2..limit).findAll { !isComposite[it] }
}

println sieve(50)
