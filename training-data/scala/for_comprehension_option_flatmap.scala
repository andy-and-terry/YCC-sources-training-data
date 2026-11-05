object ForOptionChain extends App {
  def parse(s: String): Option[Int] = s.toIntOrNull
  implicit class StrOps(s: String) { def toIntOrNull: Option[Int] = scala.util.Try(s.toInt).toOption }
  val r = for {
    a <- parse("4")
    b <- parse("5")
    if a < b
  } yield a * b
  println(r)
  println(for { a <- parse("x"); b <- parse("1") } yield a + b)
}
