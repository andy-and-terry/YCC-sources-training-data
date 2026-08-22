import scala.concurrent.{Await, Future}
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global

object FutureDemo {
  def fetchValue(value: Int): Future[Int] = Future {
    Thread.sleep(10)
    value
  }

  def main(args: Array[String]): Unit = {
    val combined = for {
      a <- fetchValue(1)
      b <- fetchValue(2)
      c <- fetchValue(3)
    } yield a + b + c

    println(Await.result(combined, 5.seconds))
  }
}
