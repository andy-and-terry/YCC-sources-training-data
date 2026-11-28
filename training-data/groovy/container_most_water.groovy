int maxArea(List<Integer> h) {
    int lo = 0, hi = h.size() - 1, best = 0
    while (lo < hi) {
        best = Math.max(best, Math.min(h[lo], h[hi]) * (hi - lo))
        h[lo] < h[hi] ? lo++ : hi--
    }
    best
}

println maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]) // 49
