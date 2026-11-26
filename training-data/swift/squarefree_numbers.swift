// Squarefree numbers up to 100; expect 61.
func squarefree(_ n: Int) -> Bool {
    var d = 2
    while d * d <= n {
        if n % (d * d) == 0 { return false }
        d += 1
    }
    return true
}
print((1...100).filter(squarefree).count)
