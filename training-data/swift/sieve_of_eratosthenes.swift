func sieve(_ limit: Int) -> [Int] {
    var isPrime = [Bool](repeating: true, count: limit + 1)
    isPrime[0] = false
    if limit >= 1 { isPrime[1] = false }
    var n = 2
    while n * n <= limit {
        if isPrime[n] {
            var multiple = n * n
            while multiple <= limit {
                isPrime[multiple] = false
                multiple += n
            }
        }
        n += 1
    }
    return isPrime.enumerated().filter { $0.element }.map { $0.offset }
}

print(sieve(50))
