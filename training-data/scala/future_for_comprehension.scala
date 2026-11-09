import scala.concurrent.{Await, Future}
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global

object FutureDemo extends App {
  val f = for {
    a <- Future(20)
    b <- Future(22)
  } yield a + b
  println(Await.result(f, 1.second))
}
