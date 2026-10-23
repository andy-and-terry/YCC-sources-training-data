List<Long> zeckendorf(long n) {
    List<Long> fibs = [1L, 2L]
    while (fibs[-1] + fibs[-2] <= n) {
        fibs << (fibs[-1] + fibs[-2])
    }
    List<Long> parts = []
    fibs.reverse().each { f ->
        if (f <= n) {
            parts << f
            n -= f
        }
    }
    return parts
}

println zeckendorf(100).join(' ')
