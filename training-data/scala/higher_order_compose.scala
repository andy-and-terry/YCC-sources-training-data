object Compose extends App {
  val inc = (x: Int) => x + 1
  val dbl = (x: Int) => x * 2
  println((inc andThen dbl)(5))
  println((inc compose dbl)(5))
  def curry(a: Int)(b: Int) = a * b
  val triple = curry(3) _
  println(List(1, 2, 3).map(triple))
}
