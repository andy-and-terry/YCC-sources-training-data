object SpiralMatrix {
  def spiral(m: List[List[Int]]): List[Int] = m match {
    case Nil => Nil
    case first :: rest => first ::: spiral(rest.transpose.reverse)
  }

  def main(args: Array[String]): Unit = {
    val grid = List(
      List(1, 2, 3, 4),
      List(5, 6, 7, 8),
      List(9, 10, 11, 12)
    )
    println(spiral(grid))
    println(spiral(List(List(1))))
    println(spiral(List(List(1, 2), List(3, 4))))
  }
}
