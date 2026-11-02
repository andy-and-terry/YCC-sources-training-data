object ForComprehensionOptionX2 extends App {
  def parse(s: String): Option[Int] = s.toIntOption
  val r = for { a <- parse("3"); b <- parse("4") } yield a + b
  println(r)
}
