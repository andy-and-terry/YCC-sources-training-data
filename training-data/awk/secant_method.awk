function f(x) { return x * x - 2 }
BEGIN {
    a = 1; b = 2
    for (i = 0; i < 40; i++) {
        if (f(b) == f(a)) break
        c = b - f(b) * (b - a) / (f(b) - f(a))
        a = b; b = c
    }
    printf "%.8f\n", b
}
