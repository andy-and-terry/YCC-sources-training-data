// n(n+1)/2+1
int term(int n) {
    return (n * (n + 1)).intdiv(2) + 1
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
