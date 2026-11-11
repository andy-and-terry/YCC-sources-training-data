# Amicable pairs: d(a) == b and d(b) == a with a != b.
function d(n,    s, i) {
    for (i = 1; i < n; i++) if (n % i == 0) s += i
    return s
}

BEGIN {
    for (a = 2; a < 1500; a++) {
        b = d(a)
        if (b > a && d(b) == a) print a, b
    }
}
