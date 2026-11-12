object Collect extends App {
  val xs = List(1, "a", 2, "b", 3)
  println(xs.collect { case n: Int => n * 2 })
  val pf: PartialFunction[Int, String] = { case 1 => "one" }
  println(pf.isDefinedAt(2) + " " + pf.lift(1))
}
