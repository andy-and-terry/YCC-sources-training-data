// Ways to write n as a sum of two or more consecutive positive integers.
object PoliteNumbers {
  def politeWays(n: Int): Int =
    Iterator.from(2).takeWhile(k => k * (k + 1) / 2 <= n)
      .count(k => (n - k * (k - 1) / 2) % k == 0)

  def main(args: Array[String]): Unit =
    println((1 to 16).map(politeWays).mkString(" "))
}
