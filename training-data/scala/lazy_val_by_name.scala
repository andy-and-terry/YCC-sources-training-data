object LazyEval extends App {
  def twice(f: => Int): Int = f + f
  lazy val expensive = { println("computing"); 42 }
  println(twice({ print("."); 1 }))
  println(expensive + expensive)
}
