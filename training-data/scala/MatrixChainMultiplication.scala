object MatrixChainMultiplication {
  def minMultiplications(dims: Array[Int]): Long = {
    val n = dims.length - 1
    val dp = Array.fill(n, n)(0L)

    for (chainLen <- 2 to n) {
      for (i <- 0 to n - chainLen) {
        val j = i + chainLen - 1
        dp(i)(j) = Long.MaxValue
        for (k <- i until j) {
          val cost = dp(i)(k) + dp(k + 1)(j) + dims(i).toLong * dims(k + 1) * dims(j + 1)
          if (cost < dp(i)(j)) dp(i)(j) = cost
        }
      }
    }
    dp(0)(n - 1)
  }

  def main(args: Array[String]): Unit = {
    // Matrices of dimensions 40x20, 20x30, 30x10, 10x30
    println(minMultiplications(Array(40, 20, 30, 10, 30)))
  }
}
