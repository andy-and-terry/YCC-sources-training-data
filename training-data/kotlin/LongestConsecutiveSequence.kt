fun longestConsecutive(nums: IntArray): Int {
    val set = nums.toHashSet()
    var best = 0
    for (n in set) {
        if (n - 1 in set) continue
        var len = 1
        while (n + len in set) len++
        best = maxOf(best, len)
    }
    return best
}

fun main() {
    println(longestConsecutive(intArrayOf(100, 4, 200, 1, 3, 2)))
    println(longestConsecutive(intArrayOf(0, 3, 7, 2, 5, 8, 4, 6, 0, 1)))
    println(longestConsecutive(intArrayOf()))
}
