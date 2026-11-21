// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
object BouncyNumbers {
  def isBouncy(n: Int): Boolean = {
    val d = n.toString
    d != d.sorted && d != d.sorted.reverse
  }

  def main(args: Array[String]): Unit =
    println((1 until 1000).count(isBouncy))
}
