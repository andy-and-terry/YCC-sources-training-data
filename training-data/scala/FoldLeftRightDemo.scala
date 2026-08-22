object FoldLeftRightDemo {
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    println(numbers.foldLeft(0)(_ + _))
    println(numbers.foldRight(List[Int]())((x, acc) => x * 2 :: acc))
    println(numbers.reduceLeft(_ max _))
  }
}
