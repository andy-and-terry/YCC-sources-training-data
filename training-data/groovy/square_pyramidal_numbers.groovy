// n(n+1)(2n+1)/6
int term(int n) {
    return ((n * (n + 1)) * ((2 * n) + 1)).intdiv(6)
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
