fun equilibriumIndex(nums: IntArray): Int {
    val total = nums.sum()
    var left = 0
    for ((i, v) in nums.withIndex()) {
        if (left == total - left - v) return i
        left += v
    }
    return -1
}

fun main() {
    println(equilibriumIndex(intArrayOf(1, 7, 3, 6, 5, 6))) // 3
}
