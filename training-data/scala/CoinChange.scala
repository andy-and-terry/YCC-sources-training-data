object CoinChange {
  def coinChange(coins: Array[Int], amount: Int): Int = {
    val dp = Array.fill(amount + 1)(amount + 1)
    dp(0) = 0
    for (a <- 1 to amount) {
      for (coin <- coins if coin <= a) {
        dp(a) = math.min(dp(a), dp(a - coin) + 1)
      }
    }
    if (dp(amount) > amount) -1 else dp(amount)
  }

  def main(args: Array[String]): Unit = {
    println(coinChange(Array(1, 2, 5), 11))
  }
}
