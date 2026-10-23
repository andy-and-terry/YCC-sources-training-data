func cullen(_ n: Int) -> Int {
    n * (1 << n) + 1
}

print((0...9).map { String(cullen($0)) }.joined(separator: " "))
