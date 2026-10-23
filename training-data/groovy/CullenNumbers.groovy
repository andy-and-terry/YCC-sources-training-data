long cullen(int n) {
    return n * (1L << n) + 1
}

println((0..9).collect { cullen(it) }.join(' '))
