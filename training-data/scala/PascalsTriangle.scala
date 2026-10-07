object PascalsTriangle {
  def rows(n: Int): List[List[Int]] =
    Iterator.iterate(List(1))(prev => 1 :: prev.zip(prev.tail).map { case (a, b) => a + b } ::: List(1))
      .take(n).toList

  def main(args: Array[String]): Unit = {
    rows(6).foreach(r => println(r.mkString(" ")))
  }
}
