object PascalsTriangle {
  def nextRow(row: List[Int]): List[Int] =
    (0 :: row).zip(row :+ 0).map { case (a, b) => a + b }

  def triangle(n: Int): List[List[Int]] =
    Iterator.iterate(List(1))(nextRow).take(n).toList

  def main(args: Array[String]): Unit = {
    val rows = triangle(6)
    val width = rows.last.mkString(" ").length
    rows.foreach { r =>
      val line = r.mkString(" ")
      println(" " * ((width - line.length) / 2) + line)
    }
  }
}
