import scala.util.{Failure, Success, Try}

object OptionEitherTryChain {
  def parse(s: String): Either[String, Int] = s.toIntOption.toRight(s"not a number: $s")
  def positive(n: Int): Either[String, Int] = Either.cond(n > 0, n, s"$n not positive")

  def main(args: Array[String]): Unit = {
    for (s <- List("5", "-2", "x")) {
      val r = for { n <- parse(s); p <- positive(n) } yield p * 2
      println(r)
    }
    println(Some(3).map(_ + 1).filter(_ > 5).getOrElse(0))
    println(Option("a").flatMap(x => Option(x.length)).orElse(Some(0)))
    Try("12".toInt) match {
      case Success(v) => println(s"ok $v")
      case Failure(e) => println(e.getMessage)
    }
    println(Try(1 / 0).recover { case _: ArithmeticException => -1 }.get)
  }
}
