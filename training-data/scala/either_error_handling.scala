object EitherDemo extends App {
  def div(a: Int, b: Int): Either[String, Int] =
    if (b == 0) Left("div by zero") else Right(a / b)

  println(for { x <- div(10, 2); y <- div(x, 0) } yield y)
  println(for { x <- div(10, 2); y <- div(x, 5) } yield y)
}
