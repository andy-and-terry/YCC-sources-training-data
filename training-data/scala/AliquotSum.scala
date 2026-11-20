// Aliquot sum with pattern-matching guards.
object AliquotSum {
  def main(args: Array[String]): Unit =
    for (n <- List(6, 12, 15, 28)) {
      val a = (1 until n).filter(n % _ == 0).sum
      val kind = a match {
        case `n`          => "perfect"
        case x if x > n   => "abundant"
        case _            => "deficient"
      }
      println(s"$n $a $kind")
    }
}
