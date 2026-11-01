object EitherValidationEx extends App {
  def positive(n: Int): Either[String, Int] = if (n > 0) Right(n) else Left(s"$n not positive")
  def even(n: Int): Either[String, Int] = if (n % 2 == 0) Right(n) else Left(s"$n not even")

  for (n <- List(4, 3, -2)) {
    println(positive(n).flatMap(even))
  }
}
