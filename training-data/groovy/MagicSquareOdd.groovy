def magicSquare(int n) {
    def sq = (0..<n).collect { [0] * n }
    int r = 0, c = n.intdiv(2)
    (1..n * n).each { k ->
        sq[r][c] = k
        int nr = (r - 1 + n) % n, nc = (c + 1) % n
        if (sq[nr][nc] != 0) { nr = (r + 1) % n; nc = c }
        r = nr
        c = nc
    }
    sq
}

magicSquare(5).each { row -> println row.collect { it.toString().padLeft(3) }.join() }
