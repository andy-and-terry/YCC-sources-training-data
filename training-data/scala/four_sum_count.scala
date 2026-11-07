object FourSumCount {
  def count(a: Seq[Int], b: Seq[Int], c: Seq[Int], d: Seq[Int]): Int = {
    val sums = (for (x <- a; y <- b) yield x + y).groupBy(identity).view.mapValues(_.size).toMap
    (for (x <- c; y <- d) yield sums.getOrElse(-(x + y), 0)).sum
  }

  def main(args: Array[String]): Unit =
    println(count(Seq(1, 2), Seq(-2, -1), Seq(-1, 2), Seq(0, 2))) // 2
}
