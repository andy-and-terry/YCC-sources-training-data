object PentatopeNumbers {
  // n(n+1)(n+2)(n+3)/24
  def term(n: Long): Long = (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24

  def main(args: Array[String]): Unit =
    for (n <- 1L to 15L)
      println(s"$n -> ${term(n)}")
}
