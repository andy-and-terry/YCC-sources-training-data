import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._

object FuturesForComprehension {
  def slow(n: Int): Future[Int] = Future { Thread.sleep(20); n * n }

  def main(args: Array[String]): Unit = {
    val f = for { a <- slow(2); b <- slow(3) } yield a + b
    println(Await.result(f, 2.seconds))
    val all = Future.sequence(List(1, 2, 3).map(slow))
    println(Await.result(all, 2.seconds))
    val failed = Future { 1 / 0 }.recover { case _: ArithmeticException => -1 }
    println(Await.result(failed, 1.second))
    println(Await.result(Future.firstCompletedOf(List(slow(1), Future { Thread.sleep(500); 0 })), 1.second))
  }
}
