object EitherDemo {
  def safeDivide(a: Int, b: Int): Either[String, Int] = {
    if (b == 0) Left("division by zero") else Right(a / b)
  }

  def main(args: Array[String]): Unit = {
    for ((a, b) <- List((10, 2), (5, 0))) {
      safeDivide(a, b) match {
        case Right(v) => println(s"$a / $b = $v")
        case Left(err) => println(s"$a / $b = error: $err")
      }
    }
  }
}
