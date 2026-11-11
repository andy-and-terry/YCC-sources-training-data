object TriangleMinPath {
  def minimumTotal(t: List[List[Int]]): Int =
    t.init.foldRight(t.last) { (row, below) =>
      row.zipWithIndex.map { case (v, i) => v + (below(i) min below(i + 1)) }
    }.head

  def main(args: Array[String]): Unit =
    println(minimumTotal(List(List(2), List(3, 4), List(6, 5, 7), List(4, 1, 8, 3)))) // 11
}
