function f(x) { return x * x - 2 }
function abs(v) { return v < 0 ? -v : v }
BEGIN {
    x0 = 1; x1 = 2
    for (i = 0; i < 50; i++) {
        f0 = f(x0); f1 = f(x1)
        if (f1 == f0) break
        nxt = x1 - f1 * (x1 - x0) / (f1 - f0)
        x0 = x1; x1 = nxt
        if (abs(x1 - x0) < 1e-12) break
    }
    printf "%.10f\n", x1
}
