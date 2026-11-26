// Circular primes below 100; expect 13.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

func circular(_ n: Int) -> Bool {
    let s = Array(String(n))
    return (0..<s.count).allSatisfy { i in
        isPrime(Int(String(s[i...] + s[..<i]))!)
    }
}
print((2..<100).filter(circular).count)
