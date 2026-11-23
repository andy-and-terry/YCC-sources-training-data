// n(n+1)(n+2)/6
int term(int n) {
    return ((n * (n + 1)) * (n + 2)).intdiv(6)
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
