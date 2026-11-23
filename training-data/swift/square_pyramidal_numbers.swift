// n(n+1)(2n+1)/6
func term(_ n: Int) -> Int {
    return ((n * (n + 1)) * ((2 * n) + 1)) / 6
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
