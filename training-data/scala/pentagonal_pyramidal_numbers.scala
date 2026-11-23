object PentagonalPyramidalNumbers {
  // n^2(n+1)/2
  def term(n: Long): Long = ((n * n) * (n + 1)) / 2

  def main(args: Array[String]): Unit =
    for (n <- 1L to 15L)
      println(s"$n -> ${term(n)}")
}
