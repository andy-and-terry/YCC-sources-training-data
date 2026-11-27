func lah(_ n: Int, _ k: Int) -> Int {
    var c = 1, f = 1
    for i in 0..<(k - 1) { c = c * (n - 1 - i) / (i + 1) }
    if k < n { for i in (k + 1)...n { f *= i } }
    return c * f
}

for n in 1...5 {
    print((1...n).map { String(lah(n, $0)) }.joined(separator: " "))
}
