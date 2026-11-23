// n(2n^2+1)/3
func term(_ n: Int) -> Int {
    return (n * (((2 * n) * n) + 1)) / 3
}

for n in 1...15 {
    print("\(n) -> \(term(n))")
}
