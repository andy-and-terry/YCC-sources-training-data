func isSphenic(_ value: Int) -> Bool {
    var n = value, distinct = 0, p = 2
    while p * p <= n {
        if n % p == 0 {
            n /= p
            if n % p == 0 { return false }
            distinct += 1
        }
        p += 1
    }
    return distinct + (n > 1 ? 1 : 0) == 3
}

print((2..<80).filter(isSphenic))
