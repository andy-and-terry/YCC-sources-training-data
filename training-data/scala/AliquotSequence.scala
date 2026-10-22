object AliquotSequence {
  def properDivisorSum(n: Int): Int =
    (1 to n / 2).filter(n % _ == 0).sum

  def main(args: Array[String]): Unit = {
    val seq = Iterator.iterate(12)(properDivisorSum).takeWhile(_ != 0).toList :+ 0
    println(seq.mkString(" "))
  }
}
