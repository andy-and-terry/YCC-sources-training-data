// Wilson's theorem primality test.
func wilson(_ n: Int) -> Bool {
    guard n >= 2 else { return false }
    let f = (2..<max(n, 2)).reduce(1) { $0 * $1 % n }
    return f == n - 1
}
print((2..<20).filter(wilson))
