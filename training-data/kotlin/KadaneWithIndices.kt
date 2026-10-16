data class SubarrayResult(val sum: Int, val from: Int, val to: Int)

fun maxSubarray(a: IntArray): SubarrayResult {
    var best = a[0]
    var cur = a[0]
    var start = 0
    var bestStart = 0
    var bestEnd = 0
    for (i in 1 until a.size) {
        if (cur < 0) {
            cur = a[i]
            start = i
        } else {
            cur += a[i]
        }
        if (cur > best) {
            best = cur
            bestStart = start
            bestEnd = i
        }
    }
    return SubarrayResult(best, bestStart, bestEnd)
}

fun main() {
    println(maxSubarray(intArrayOf(-2, 1, -3, 4, -1, 2, 1, -5, 4)))
    println(maxSubarray(intArrayOf(-3, -1, -2)))
}
