// n(n+1)/2+1
func term(_ n: Int) -> Int {
    return ((n * (n + 1)) / 2) + 1
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
