// Goldbach pair returning an optional tuple.
func isPrime(_ n: Int) -> Bool {
    guard n > 1 else { return false }
    var d = 2
    while d * d <= n { if n % d == 0 { return false }; d += 1 }
    return true
}
func goldbach(_ n: Int) -> (Int, Int)? {
    for p in 2...(n / 2) where isPrime(p) && isPrime(n - p) { return (p, n - p) }
    return nil
}
if let (a, b) = goldbach(28) { print("\(a) + \(b)") }
