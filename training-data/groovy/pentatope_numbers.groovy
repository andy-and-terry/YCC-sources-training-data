// n(n+1)(n+2)(n+3)/24
int term(int n) {
    return (((n * (n + 1)) * (n + 2)) * (n + 3)).intdiv(24)
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
