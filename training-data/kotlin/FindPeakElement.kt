fun findPeak(a: IntArray): Int {
    var lo = 0
    var hi = a.lastIndex
    while (lo < hi) {
        val mid = (lo + hi) / 2
        if (a[mid] < a[mid + 1]) lo = mid + 1 else hi = mid
    }
    return lo
}

fun main() {
    val a = intArrayOf(1, 2, 1, 3, 5, 6, 4)
    val p = findPeak(a)
    println("peak index $p value ${a[p]}")
    println(findPeak(intArrayOf(1, 2, 3, 4)))
    println(findPeak(intArrayOf(9, 3, 1)))
}
