fun maxArea(h: IntArray): Int {
    var lo = 0
    var hi = h.lastIndex
    var best = 0
    while (lo < hi) {
        best = maxOf(best, minOf(h[lo], h[hi]) * (hi - lo))
        if (h[lo] < h[hi]) lo++ else hi--
    }
    return best
}

fun main() {
    println(maxArea(intArrayOf(1, 8, 6, 2, 5, 4, 8, 3, 7))) // 49
}
