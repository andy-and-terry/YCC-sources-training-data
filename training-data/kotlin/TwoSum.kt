fun twoSum(nums: IntArray, target: Int): Pair<Int, Int>? {
    val seen = mutableMapOf<Int, Int>()
    for ((i, n) in nums.withIndex()) {
        val complement = target - n
        seen[complement]?.let { return Pair(it, i) }
        seen[n] = i
    }
    return null
}

fun main() {
    println(twoSum(intArrayOf(2, 7, 11, 15), 9))
}
