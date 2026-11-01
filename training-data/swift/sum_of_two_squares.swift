// Positive n expressible as a*a + b*b with a, b >= 0.
func representable(_ n: Int) -> Bool {
    var a = 0
    while a * a <= n {
        var b = a
        while a * a + b * b <= n {
            if a * a + b * b == n { return true }
            b += 1
        }
        a += 1
    }
    return false
}

print((1...30).filter(representable).map(String.init).joined(separator: " "))
