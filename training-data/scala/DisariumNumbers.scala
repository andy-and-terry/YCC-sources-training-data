// Disarium numbers: digits raised to their 1-based positions sum to n.
object DisariumNumbers {
  def isDisarium(n: Int): Boolean =
    n.toString.zipWithIndex.map { case (c, i) => math.pow(c - '0', i + 1).toInt }.sum == n

  def main(args: Array[String]): Unit =
    println((1 until 1000).filter(isDisarium).mkString(" "))
}
