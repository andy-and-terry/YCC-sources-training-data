func isPrime(_ n: Int) -> Bool {
    guard n >= 2 else { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let n = 28
for p in 2...(n / 2) where isPrime(p) && isPrime(n - p) {
    print("\(p) + \(n - p)")
}
