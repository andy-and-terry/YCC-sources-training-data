// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
func mobius(_ start: Int) -> Int {
    var n = start
    var result = 1
    var p = 2
    while p * p <= n {
        if n % p == 0 {
            n /= p
            if n % p == 0 { return 0 }
            result = -result
        }
        p += 1
    }
    return n > 1 ? -result : result
}

print((1...30).map { String(mobius($0)) }.joined(separator: " "))
