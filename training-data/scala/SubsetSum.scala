object SubsetSum {
  def subsetSumExists(nums: List[Int], target: Int): Boolean = {
    val dp = Array.fill(target + 1)(false)
    dp(0) = true

    for (value <- nums) {
      for (t <- target to value by -1) {
        if (dp(t - value)) dp(t) = true
      }
    }
    dp(target)
  }

  def main(args: Array[String]): Unit = {
    println(subsetSumExists(List(3, 34, 4, 12, 5, 2), 9))
    println(subsetSumExists(List(3, 34, 4, 12, 5, 2), 30))
  }
}
