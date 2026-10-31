long cubeFromOdds(long n) {
    long start = n * n - n + 1
    (0..<n).sum { i -> start + 2 * i } as long
}

(1..5).each { n -> println "$n ${cubeFromOdds(n)} ${cubeFromOdds(n) == n * n * n}" }
