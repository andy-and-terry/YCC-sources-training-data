object LazyCatererSequence {
  // n(n+1)/2+1
  def term(n: Long): Long = ((n * (n + 1)) / 2) + 1

  def main(args: Array[String]): Unit =
    for (n <- 1L to 15L)
      println(s"$n -> ${term(n)}")
}
