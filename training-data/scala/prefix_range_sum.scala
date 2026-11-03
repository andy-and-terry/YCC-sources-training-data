class RangeSum(values: Seq[Int]) {
  private val prefix: Vector[Long] = values.scanLeft(0L)(_ + _).toVector
  def query(lo: Int, hi: Int): Long = prefix(hi) - prefix(lo)
}

object PrefixRangeSum {
  def main(args: Array[String]): Unit =
    println(new RangeSum(Seq(3, 1, 4, 1, 5, 9, 2, 6)).query(2, 5))
}
