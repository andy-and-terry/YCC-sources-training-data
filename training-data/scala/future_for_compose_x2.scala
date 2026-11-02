import scala.concurrent._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._

object FutureForComposeX2 extends App {
  val f = for { a <- Future(20); b <- Future(22) } yield a + b
  println(Await.result(f, 1.second))
}
