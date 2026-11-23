// n(2n^2+1)/3
int term(int n) {
    return (n * (((2 * n) * n) + 1)).intdiv(3)
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
