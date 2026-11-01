// Positive n expressible as a*a + b*b with a, b >= 0.
boolean representable(int n) {
    for (int a = 0; a * a <= n; a++) {
        int b = Math.round(Math.sqrt((n - a * a) as double)) as int
        if (a * a + b * b == n) return true
    }
    return false
}

println((1..30).findAll { representable(it) }.join(' '))
