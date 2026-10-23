func woodall(_ n: Int) -> Int {
    n * (1 << n) - 1
}

print((1...10).map { String(woodall($0)) }.joined(separator: " "))
