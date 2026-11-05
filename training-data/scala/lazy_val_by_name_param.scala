object LazyByName extends App {
  lazy val heavy = { println("computing"); 42 }
  def twice(x: => Int): Int = x + x
  println("before")
  println(heavy)
  println(heavy)
  println(twice({ println("eval"); 1 }))
}
