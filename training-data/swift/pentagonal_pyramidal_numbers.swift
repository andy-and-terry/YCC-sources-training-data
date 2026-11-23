// n^2(n+1)/2
func term(_ n: Int) -> Int {
    return ((n * n) * (n + 1)) / 2
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
