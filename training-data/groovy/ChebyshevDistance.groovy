int chebyshev(List<Integer> a, List<Integer> b) {
    (0..<a.size()).collect { Math.abs(a[it] - b[it]) }.max()
}

println chebyshev([1, 2], [4, 6])
