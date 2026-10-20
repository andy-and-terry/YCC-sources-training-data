object Main extends App {
  def parse(s: String): Option[Int] = s.toIntOption
  val r = for {
    a <- parse("4")
    b <- parse("5")
  } yield a * b
  println(r)
  println(for (a <- parse("x"); b <- parse("1")) yield a + b)
}
