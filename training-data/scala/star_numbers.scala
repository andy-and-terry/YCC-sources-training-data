object StarNumbers {
  // 6n(n-1)+1
  def term(n: Long): Long = ((6 * n) * (n - 1)) + 1

  def main(args: Array[String]): Unit =
    for (n <- 1L to 15L)
      println(s"$n -> ${term(n)}")
}
