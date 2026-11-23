// 6n(n-1)+1
func term(_ n: Int) -> Int {
    return ((6 * n) * (n - 1)) + 1
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
