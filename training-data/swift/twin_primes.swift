// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let twins = (2..<100).filter { isPrime($0) && isPrime($0 + 2) }
print(twins.map(String.init).joined(separator: " "))
