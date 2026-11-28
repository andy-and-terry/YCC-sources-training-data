func maxArea(_ h: [Int]) -> Int {
    var lo = 0, hi = h.count - 1, best = 0
    while lo < hi {
        best = max(best, min(h[lo], h[hi]) * (hi - lo))
        if h[lo] < h[hi] { lo += 1 } else { hi -= 1 }
    }
    return best
}

print(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])) // 49
