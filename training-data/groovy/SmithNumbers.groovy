long digitSum(long n) {
    long s = 0
    while (n > 0) {
        s += n % 10
        n = n.intdiv(10)
    }
    return s
}

List<Long> primeFactors(long n) {
    List<Long> fs = []
    long p = 2
    while (n > 1) {
        if (p * p > n) {
            fs << n
            break
        }
        while (n % p == 0) {
            fs << p
            n = n.intdiv(p)
        }
        p++
    }
    return fs
}

boolean isSmith(long n) {
    def fs = primeFactors(n)
    return fs.size() > 1 && digitSum(n) == fs.sum { digitSum(it) }
}

println((2..99).findAll { isSmith(it) }.join(' '))
