// Pernicious numbers: the popcount is prime.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let out = (1...20).filter { isPrime($0.nonzeroBitCount) }
print(out.map(String.init).joined(separator: " "))
