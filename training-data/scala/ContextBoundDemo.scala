object ContextBoundDemo {
  def sum[T: Numeric](values: List[T]): T = {
    val num = implicitly[Numeric[T]]
    values.foldLeft(num.zero)(num.plus)
  }

  def maxOf[T: Ordering](values: List[T]): T = {
    val ord = implicitly[Ordering[T]]
    values.reduce((a, b) => if (ord.gt(a, b)) a else b)
  }

  def main(args: Array[String]): Unit = {
    println(sum(List(1, 2, 3, 4)))
    println(sum(List(1.5, 2.5, 3.0)))
    println(maxOf(List(3, 7, 2, 9, 4)))
    println(maxOf(List("pear", "apple", "banana")))
  }
}
