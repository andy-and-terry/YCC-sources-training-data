func isPowerful(_ value: Int) -> Bool {
    var n = value, p = 2
    while p * p <= n {
        if n % p == 0 {
            if n % (p * p) != 0 { return false }
            while n % p == 0 { n /= p }
        }
        p += 1
    }
    return n == 1
}

print((1...100).filter(isPowerful).map(String.init).joined(separator: " "))
