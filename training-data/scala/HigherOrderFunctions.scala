object HigherOrderFunctions {
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    val doubled = numbers.map(_ * 2)
    val evens = numbers.filter(_ % 2 == 0)
    val sum = numbers.foldLeft(0)(_ + _)

    println(doubled)
    println(evens)
    println(sum)

    def compose(f: Int => Int, g: Int => Int): Int => Int = x => f(g(x))
    val addOneThenDouble = compose(_ * 2, _ + 1)
    println(addOneThenDouble(3))
  }
}
