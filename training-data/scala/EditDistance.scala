object EditDistance {
  def distance(a: String, b: String): Int = {
    val dp = Array.ofDim[Int](a.length + 1, b.length + 1)

    for (i <- 0 to a.length) dp(i)(0) = i
    for (j <- 0 to b.length) dp(0)(j) = j

    for (i <- 1 to a.length; j <- 1 to b.length) {
      if (a(i - 1) == b(j - 1)) dp(i)(j) = dp(i - 1)(j - 1)
      else dp(i)(j) = 1 + math.min(dp(i - 1)(j - 1), math.min(dp(i - 1)(j), dp(i)(j - 1)))
    }
    dp(a.length)(b.length)
  }

  def main(args: Array[String]): Unit = {
    println(distance("horse", "ros"))
    println(distance("intention", "execution"))
  }
}
