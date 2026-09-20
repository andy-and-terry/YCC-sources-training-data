object RodCutting {
  def maxProfit(prices: Array[Int], length: Int): Int = {
    val dp = Array.fill(length + 1)(0)
    for (len <- 1 to length) {
      var best = 0
      for (cut <- 1 to len) {
        best = math.max(best, prices(cut - 1) + dp(len - cut))
      }
      dp(len) = best
    }
    dp(length)
  }

  def main(args: Array[String]): Unit = {
    val prices = Array(1, 5, 8, 9, 10, 17, 17, 20)
    println(maxProfit(prices, prices.length))
  }
}
