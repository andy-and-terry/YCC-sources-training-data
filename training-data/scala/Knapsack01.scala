object Knapsack01 {
  def knapsack(weights: Array[Int], values: Array[Int], capacity: Int): Int = {
    val n = weights.length
    val dp = Array.ofDim[Int](n + 1, capacity + 1)
    for (i <- 1 to n; w <- 0 to capacity) {
      dp(i)(w) = if (weights(i - 1) <= w) {
        math.max(dp(i - 1)(w), dp(i - 1)(w - weights(i - 1)) + values(i - 1))
      } else {
        dp(i - 1)(w)
      }
    }
    dp(n)(capacity)
  }

  def main(args: Array[String]): Unit = {
    println(knapsack(Array(1, 3, 4, 5), Array(1, 4, 5, 7), 7))
  }
}
