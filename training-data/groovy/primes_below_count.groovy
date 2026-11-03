int countPrimesBelow(int n) {
    if (n < 3) return 0
    def composite = new boolean[n]
    int count = 0
    (2..<n).each { i ->
        if (!composite[i]) {
            count++
            for (long j = (long) i * i; j < n; j += i) composite[(int) j] = true
        }
    }
    count
}
println countPrimesBelow(100)
