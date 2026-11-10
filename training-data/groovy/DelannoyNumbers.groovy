long centralDelannoy(int n) {
    def g = (0..n).collect { [1L] * (n + 1) }
    (1..n).each { i -> (1..n).each { j -> g[i][j] = g[i-1][j] + g[i][j-1] + g[i-1][j-1] } }
    g[n][n]
}

println (0..5).collect { centralDelannoy(it) }.join(' ') // 1 3 13 63 321 1683
