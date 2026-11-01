// n is triangular iff 8n + 1 is a perfect square.
object TriangularCheck {
  def isTriangular(n: Int): Boolean = {
    val s = 8 * n + 1
    val r = math.round(math.sqrt(s.toDouble)).toInt
    r * r == s
  }

  def main(args: Array[String]): Unit =
    println((0 to 20).filter(isTriangular).mkString(" "))
}
