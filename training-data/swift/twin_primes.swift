// Twin primes below 100; expect 8.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

print((2..<100).filter { isPrime($0) && isPrime($0 + 2) }.count)
