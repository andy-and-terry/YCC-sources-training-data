boolean lucasLehmer(int p) {
    if (p == 2) return true
    long m = (1L << p) - 1
    long s = 4
    (p - 2).times {
        s = (s * s - 2) % m
    }
    return s == 0
}

println([2, 3, 5, 7, 11, 13, 17, 19].findAll { lucasLehmer(it) }.join(' '))
