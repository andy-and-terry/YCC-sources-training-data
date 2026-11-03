boolean isPerfectSquare(long n) {
    if (n < 0) return false
    long r = Math.sqrt(n) as long
    r * r == n
}
println (0..<30).findAll { isPerfectSquare(it) }
