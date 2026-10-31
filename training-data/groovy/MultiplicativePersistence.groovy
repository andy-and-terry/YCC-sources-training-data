int persistence(long n) {
    int steps = 0
    while (n >= 10) {
        n = n.toString().toList().inject(1L) { acc, d -> acc * Long.parseLong(d) }
        steps++
    }
    steps
}

[39L, 77L, 999L, 10L].each { println "$it ${persistence(it)}" }
