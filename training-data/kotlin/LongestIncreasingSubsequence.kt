fun lengthOfLIS(nums: IntArray): Int {
    if (nums.isEmpty()) return 0
    val tails = mutableListOf<Int>()

    for (num in nums) {
        var lo = 0
        var hi = tails.size
        while (lo < hi) {
            val mid = (lo + hi) / 2
            if (tails[mid] < num) lo = mid + 1 else hi = mid
        }
        if (lo == tails.size) tails.add(num) else tails[lo] = num
    }
    return tails.size
}

fun main() {
    val nums = intArrayOf(10, 9, 2, 5, 3, 7, 101, 18)
    println(lengthOfLIS(nums))
}
