object GolombSequence {
  def golomb(count: Int): Vector[Int] = {
    val g = Array.fill(count + 1)(0)
    g(1) = 1
    for (n <- 2 to count) g(n) = 1 + g(n - g(g(n - 1)))
    g.drop(1).toVector
  }

  def main(args: Array[String]): Unit =
    println(golomb(20).mkString(" "))
}
