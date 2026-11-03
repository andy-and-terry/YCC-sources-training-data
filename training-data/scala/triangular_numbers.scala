object TriangularNumbers {
  val triangular: LazyList[Int] = LazyList.from(1).scanLeft(0)(_ + _).tail

  def main(args: Array[String]): Unit = println(triangular.take(10).toList)
}
