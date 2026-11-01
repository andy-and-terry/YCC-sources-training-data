// Positive n expressible as a*a + b*b with a, b >= 0.
object SumOfTwoSquares {
  def representable(n: Int): Boolean =
    Iterator.from(0).takeWhile(a => a * a <= n).exists { a =>
      val b = math.round(math.sqrt((n - a * a).toDouble)).toInt
      a * a + b * b == n
    }

  def main(args: Array[String]): Unit =
    println((1 to 30).filter(representable).mkString(" "))
}
