case class Item(name: String, qty: Int, tags: List[String] = Nil)

object CaseClassCopyPatternEx extends App {
  val a = Item("pen", 2)
  val b = a.copy(qty = 5, tags = List("blue"))
  println(b)
  b match {
    case Item(n, q, t :: _) if q > 3 => println(s"$n bulk tag=$t")
    case _ => println("other")
  }
}
