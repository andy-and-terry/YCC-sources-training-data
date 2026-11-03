func countPrimesBelow(_ n: Int) -> Int {
    guard n > 2 else { return 0 }
    var isPrime = [Bool](repeating: true, count: n)
    isPrime[0] = false
    isPrime[1] = false
    var i = 2
    while i * i < n {
        if isPrime[i] {
            for j in stride(from: i * i, to: n, by: i) { isPrime[j] = false }
        }
        i += 1
    }
    return isPrime.filter { $0 }.count
}

print(countPrimesBelow(100))
