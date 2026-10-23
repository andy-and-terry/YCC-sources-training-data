object SternDiatomicSequence {
  def stern(count: Int): Vector[Int] =
    (2 until count).foldLeft(Vector(0, 1)) { (s, n) =>
      s :+ (if (n % 2 == 0) s(n / 2) else s(n / 2) + s(n / 2 + 1))
    }.take(count)

  def main(args: Array[String]): Unit =
    println(stern(20).mkString(" "))
}
