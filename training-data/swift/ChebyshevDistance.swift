func chebyshev(_ a: [Int], _ b: [Int]) -> Int {
    zip(a, b).map { abs($0 - $1) }.max() ?? 0
}

print(chebyshev([1, 2], [4, 6]))
