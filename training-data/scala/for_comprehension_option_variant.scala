object ForOpt extends App {
  def parse(s: String): Option[Int] = s.toIntOrNull
  extension (s: String) def toIntOrNull: Option[Int] = scala.util.Try(s.toInt).toOption

  val r = for {
    a <- parse("4")
    b <- parse("5")
  } yield a * b
  println(r)
}
