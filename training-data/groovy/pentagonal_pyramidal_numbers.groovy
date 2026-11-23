// n^2(n+1)/2
int term(int n) {
    return ((n * n) * (n + 1)).intdiv(2)
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
