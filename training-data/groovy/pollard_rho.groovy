long gcd(long a, long b) { b == 0 ? a : gcd(b, a % b) }

long rho(long n) {
    if (n % 2 == 0) return 2
    def f = { long v -> (v * v + 1) % n }
    long x = 2, y = 2, d = 1
    while (d == 1) {
        x = f(x)
        y = f(f(y))
        d = gcd(Math.abs(x - y), n)
    }
    d
}

long n = 8051
long p = rho(n)
println "$n = $p * ${n.intdiv(p)}"
