// 6n(n-1)+1
int term(int n) {
    return ((6 * n) * (n - 1)) + 1
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
