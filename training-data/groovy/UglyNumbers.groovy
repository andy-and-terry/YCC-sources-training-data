long ugly(int n) {
    def seq = [1L]
    int i2 = 0, i3 = 0, i5 = 0
    while (seq.size() < n) {
        long next = [seq[i2] * 2, seq[i3] * 3, seq[i5] * 5].min()
        seq << next
        if (next == seq[i2] * 2) i2++
        if (next == seq[i3] * 3) i3++
        if (next == seq[i5] * 5) i5++
    }
    seq[n - 1]
}

println((1..12).collect { ugly(it) })
