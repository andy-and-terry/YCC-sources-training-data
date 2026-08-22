fun maxSubArray(nums: IntArray): Int {
    var maxSoFar = nums[0]
    var maxEndingHere = nums[0]
    for (i in 1 until nums.size) {
        maxEndingHere = maxOf(nums[i], maxEndingHere + nums[i])
        maxSoFar = maxOf(maxSoFar, maxEndingHere)
    }
    return maxSoFar
}

fun main() {
    println(maxSubArray(intArrayOf(-2, 1, -3, 4, -1, 2, 1, -5, 4)))
}
