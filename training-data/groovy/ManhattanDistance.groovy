int manhattan(List<Integer> a, List<Integer> b) {
    (0..<a.size()).sum { Math.abs(a[it] - b[it]) } as int
}

println manhattan([1, 2], [4, 6])
