object ZeckendorfRepresentation {
  def zeckendorf(target: Long): List[Long] = {
    val fibs = Iterator.iterate((1L, 2L)) { case (a, b) => (b, a + b) }
      .map(_._1)
      .takeWhile(_ <= target)
      .toList
    val (parts, _) = fibs.reverse.foldLeft((List.empty[Long], target)) {
      case ((acc, n), f) => if (f <= n) (acc :+ f, n - f) else (acc, n)
    }
    parts
  }

  def main(args: Array[String]): Unit = {
    println(zeckendorf(100).mkString(" "))
  }
}
