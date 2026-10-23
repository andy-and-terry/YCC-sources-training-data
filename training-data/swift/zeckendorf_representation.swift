func zeckendorf(_ target: Int) -> [Int] {
    var fibs = [1, 2]
    while fibs[fibs.count - 1] <= target {
        fibs.append(fibs[fibs.count - 1] + fibs[fibs.count - 2])
    }
    var n = target
    var parts: [Int] = []
    for f in fibs.reversed() where f <= n {
        parts.append(f)
        n -= f
    }
    return parts
}

print(zeckendorf(100).map { String($0) }.joined(separator: " "))
