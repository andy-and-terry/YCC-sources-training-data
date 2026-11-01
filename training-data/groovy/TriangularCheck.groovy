// n is triangular iff 8n + 1 is a perfect square.
boolean isTriangular(int n) {
    int s = 8 * n + 1
    int r = Math.round(Math.sqrt(s as double)) as int
    return r * r == s
}

println((0..20).findAll { isTriangular(it) }.join(' '))
