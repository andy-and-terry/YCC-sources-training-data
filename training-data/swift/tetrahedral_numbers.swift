// n(n+1)(n+2)/6
func term(_ n: Int) -> Int {
    return ((n * (n + 1)) * (n + 2)) / 6
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
