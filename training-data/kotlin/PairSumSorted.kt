fun pairWithSum(nums: IntArray, target: Int): Pair<Int, Int>? {
    var i = 0
    var j = nums.lastIndex
    while (i < j) {
        val s = nums[i] + nums[j]
        when {
            s == target -> return i to j
            s < target -> i++
            else -> j--
        }
    }
    return null
}

fun main() {
    println(pairWithSum(intArrayOf(1, 3, 4, 6, 8, 11), 10))
    println(pairWithSum(intArrayOf(1, 2, 3), 100))
}
