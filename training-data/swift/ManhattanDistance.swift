func manhattan(_ a: [Int], _ b: [Int]) -> Int {
    zip(a, b).map { abs($0 - $1) }.reduce(0, +)
}

print(manhattan([1, 2], [4, 6]))
