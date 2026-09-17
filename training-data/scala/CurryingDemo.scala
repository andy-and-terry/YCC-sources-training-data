object CurryingDemo {
  def add(a: Int)(b: Int): Int = a + b

  def multiplyAll(factor: Int)(xs: List[Int]): List[Int] = xs.map(_ * factor)

  def main(args: Array[String]): Unit = {
    val addFive = add(5) _
    println(addFive(10))

    val triple = multiplyAll(3) _
    println(triple(List(1, 2, 3)))

    val curriedSum = (a: Int, b: Int, c: Int) => a + b + c
    val curried = curriedSum.curried
    println(curried(1)(2)(3))
  }
}
