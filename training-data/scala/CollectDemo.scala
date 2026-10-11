object CollectDemo {
  sealed trait Event
  case class Click(x: Int, y: Int) extends Event
  case class Key(c: Char) extends Event
  case object Quit extends Event

  def main(args: Array[String]): Unit = {
    val events: List[Event] = List(Click(1, 2), Key('a'), Quit, Click(5, 5), Key('z'))

    val keys = events.collect { case Key(c) => c }
    println(keys)

    val origin = events.collect { case Click(x, y) if x == y => (x, y) }
    println(origin)

    val firstQuit = events.collectFirst { case Quit => "found quit" }
    println(firstQuit)

    val mixed: List[Any] = List(1, "two", 3.0, 4)
    println(mixed.collect { case i: Int => i * 2 })
    println(mixed.collect { case s: String => s.length })
  }
}
