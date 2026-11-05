import scala.util.{Try, Success, Failure}

object TryRecover extends App {
  def div(a: Int, b: Int): Try[Int] = Try(a / b)
  println(div(10, 2))
  println(div(1, 0).recover { case _: ArithmeticException => -1 })
  div(8, 0) match {
    case Success(v) => println(s"ok $v")
    case Failure(e) => println(s"failed: ${e.getMessage}")
  }
}
