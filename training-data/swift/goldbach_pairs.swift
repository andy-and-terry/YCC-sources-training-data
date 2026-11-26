// Goldbach partitions of 100; expect 6.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

let pairs = (2...50).filter { isPrime($0) && isPrime(100 - $0) }.map { ($0, 100 - $0) }
print(pairs.count, pairs)
