import scala.util.{Try, Success, Failure}

object TryDemo {
  def parseAndInvert(s: String): Try[Double] = Try(1.0 / s.toInt)

  def main(args: Array[String]): Unit = {
    for (input <- List("4", "0", "oops")) {
      parseAndInvert(input) match {
        case Success(value) => println(s"$input -> $value")
        case Failure(ex)    => println(s"$input -> failed: ${ex.getClass.getSimpleName}")
      }
    }

    val chained = for {
      a <- Try("10".toInt)
      b <- Try("2".toInt)
    } yield a / b
    println(chained.getOrElse(-1))

    println(Try("bad".toInt).recover { case _: NumberFormatException => -1 }.get)
  }
}
