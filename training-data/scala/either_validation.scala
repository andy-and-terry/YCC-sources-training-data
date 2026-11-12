object EitherVal extends App {
  def age(n: Int): Either[String, Int] = if (n < 0) Left("negative") else Right(n)
  def name(s: String): Either[String, String] = if (s.isEmpty) Left("empty") else Right(s)
  val r = for { a <- age(30); n <- name("Ann") } yield (n, a)
  println(r)
  println(for { a <- age(-1); n <- name("") } yield (n, a))
}
