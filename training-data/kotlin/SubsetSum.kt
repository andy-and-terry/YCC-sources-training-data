fun hasSubsetSum(nums: IntArray, target: Int): Boolean {
    val dp = BooleanArray(target + 1)
    dp[0] = true
    for (num in nums) {
        for (sum in target downTo num) {
            if (dp[sum - num]) dp[sum] = true
        }
    }
    return dp[target]
}

fun main() {
    val nums = intArrayOf(3, 34, 4, 12, 5, 2)
    println(hasSubsetSum(nums, 9))
    println(hasSubsetSum(nums, 21))
    println(hasSubsetSum(nums, 10))
}
