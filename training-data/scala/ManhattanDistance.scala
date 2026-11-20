// Manhattan distance with zip.
object ManhattanDistance {
  def manhattan(a: Seq[Int], b: Seq[Int]): Int = a.zip(b).map { case (x, y) => (x - y).abs }.sum
  def main(args: Array[String]): Unit = println(manhattan(Seq(1, 2), Seq(4, 6)))
}
