func primeFactorCount(_ value: Int) -> Int {
    var n = value, count = 0, p = 2
    while p * p <= n {
        while n % p == 0 {
            n /= p
            count += 1
        }
        p += 1
    }
    return n > 1 ? count + 1 : count
}

print((2..<30).filter { primeFactorCount($0) == 2 })
