object ManhattanDistance extends App {
  def manhattan(a: Seq[Int], b: Seq[Int]): Int = a.zip(b).map { case (x, y) => math.abs(x - y) }.sum
  println(manhattan(Seq(1, 2), Seq(4, 6)))
}
