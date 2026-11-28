function gcd(a, b) { while (b) { t = a % b; a = b; b = t } return a }
function rho(n,   x, y, d, c) {
    if (n % 2 == 0) return 2
    x = 2; y = 2; d = 1; c = 1
    while (d == 1) {
        x = (x * x + c) % n
        y = (y * y + c) % n
        y = (y * y + c) % n
        d = gcd(x > y ? x - y : y - x, n)
    }
    return d
}
BEGIN { n = 8051; f = rho(n); print n, "=", f, "*", n / f }
