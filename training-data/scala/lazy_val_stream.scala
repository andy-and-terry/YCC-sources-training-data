object Main extends App {
  lazy val expensive = { println("init"); 42 }
  println("before")
  println(expensive + expensive)
  val evens = LazyList.from(0, 2).take(5).toList
  println(evens)
}
