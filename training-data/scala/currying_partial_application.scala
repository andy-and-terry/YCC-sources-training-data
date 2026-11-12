object Curry extends App {
  def add(a: Int)(b: Int) = a + b
  val inc = add(1) _
  val f = (a: Int, b: Int) => a * b
  println(inc(5) + " " + f.curried(3)(4))
}
