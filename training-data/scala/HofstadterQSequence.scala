object HofstadterQSequence {
  def hofstadterQ(count: Int): Vector[Int] = {
    val q = Array.fill(count + 1)(0)
    q(1) = 1
    q(2) = 1
    for (n <- 3 to count) q(n) = q(n - q(n - 1)) + q(n - q(n - 2))
    q.drop(1).toVector
  }

  def main(args: Array[String]): Unit =
    println(hofstadterQ(20).mkString(" "))
}
