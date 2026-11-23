// 3n(n-1)+1
int term(int n) {
    return ((3 * n) * (n - 1)) + 1
}

(1..15).each { n ->
    println "${n} -> ${term(n)}"
}
