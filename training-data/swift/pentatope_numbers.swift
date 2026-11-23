// n(n+1)(n+2)(n+3)/24
func term(_ n: Int) -> Int {
    return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
