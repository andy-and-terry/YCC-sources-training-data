// Sophie Germain primes: p prime and 2p + 1 prime.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let primes = (2..<100).filter { isPrime($0) && isPrime(2 * $0 + 1) }
print(primes.map(String.init).joined(separator: " "))
