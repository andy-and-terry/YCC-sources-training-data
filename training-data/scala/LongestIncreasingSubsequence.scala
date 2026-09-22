object LongestIncreasingSubsequence {
  def length(nums: Array[Int]): Int = {
    if (nums.isEmpty) return 0
    val dp = Array.fill(nums.length)(1)
    for (i <- nums.indices; j <- 0 until i) {
      if (nums(j) < nums(i)) dp(i) = math.max(dp(i), dp(j) + 1)
    }
    dp.max
  }

  def main(args: Array[String]): Unit = {
    val nums = Array(10, 9, 2, 5, 3, 7, 101, 18)
    println(length(nums))
  }
}
