object PartialFunctionsCollect {
  def main(args: Array[String]): Unit = {
    val pf: PartialFunction[Int, String] = { case 1 => "one"; case 2 => "two" }
    println(pf.isDefinedAt(3) + " " + pf.lift(2) + " " + pf.lift(5))
    println(List(1, 2, 3, 4).collect(pf))
    println(List(1, "a", 2.5, 3).collect { case i: Int => i * 2 })
    val fallback = pf.orElse[Int, String] { case _ => "many" }
    println(List(1, 2, 3).map(fallback))
    val add = (a: Int, b: Int) => a + b
    val curried = add.curried
    val inc = curried(1)
    println(inc(5) + " " + List(1, 2).map(add(10, _)))
    def twice(f: Int => Int): Int => Int = f andThen f
    println(twice(_ + 3)(1))
    val compose = ((x: Int) => x * 2) compose ((x: Int) => x + 1)
    println(compose(4))
  }
}
