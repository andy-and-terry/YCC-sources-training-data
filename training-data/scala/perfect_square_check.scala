object PerfectSquareCheck {
  def isPerfectSquare(n: Long): Boolean = {
    if (n < 0) false
    else {
      val r = math.sqrt(n.toDouble).toLong
      r * r == n
    }
  }

  def main(args: Array[String]): Unit =
    println((0L until 30L).filter(isPerfectSquare).mkString(" "))
}
