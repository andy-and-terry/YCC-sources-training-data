object PartialApplicationDemo {
  def add(a: Int, b: Int, c: Int): Int = a + b + c

  def greet(greeting: String, name: String): String = s"$greeting, $name!"

  def main(args: Array[String]): Unit = {
    val addTen = add(10, _: Int, _: Int)
    println(addTen(1, 2))

    val addTenAndFive = add(10, 5, _: Int)
    println(addTenAndFive(1))

    val sayHello = greet("Hello", _: String)
    println(List("Ann", "Bob").map(sayHello))

    val curried = (add _).curried
    println(curried(1)(2)(3))
    val plusOne = curried(1)(0)
    println(plusOne(41))

    val uncurried = Function.uncurried(curried)
    println(uncurried(4, 5, 6))

    val tupled = (greet _).tupled
    println(tupled(("Hi", "Cy")))

    val f: Int => Int = _ + 1
    val g: Int => Int = _ * 2
    println((f andThen g)(5))
    println((f compose g)(5))

    def multiplier(factor: Int): Int => Int = x => x * factor
    println(List(1, 2, 3).map(multiplier(3)))
    println(Option(5).map(add(1, 2, _)))
  }
}
