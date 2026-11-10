object DelannoyNumbers {
  def centralDelannoy(n: Int): Long = {
    val g = Array.fill(n + 1, n + 1)(1L)
    for (i <- 1 to n; j <- 1 to n) g(i)(j) = g(i - 1)(j) + g(i)(j - 1) + g(i - 1)(j - 1)
    g(n)(n)
  }

  def main(args: Array[String]): Unit =
    println((0 to 5).map(centralDelannoy).mkString(" ")) // 1 3 13 63 321 1683
}
