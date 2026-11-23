object OctahedralNumbers {
  // n(2n^2+1)/3
  def term(n: Long): Long = (n * (((2 * n) * n) + 1)) / 3

  def main(args: Array[String]): Unit =
    for (n <- 1L to 15L)
      println(s"$n -> ${term(n)}")
}
