long woodall(int n) {
    return n * (1L << n) - 1
}

println((1..10).collect { woodall(it) }.join(' '))
