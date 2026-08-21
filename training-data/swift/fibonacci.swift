var cache: [Int: Int] = [:]

func fibonacci(_ n: Int) -> Int {
    if n < 2 { return n }
    if let cached = cache[n] { return cached }
    let result = fibonacci(n - 1) + fibonacci(n - 2)
    cache[n] = result
    return result
}

print((0..<10).map(fibonacci))
