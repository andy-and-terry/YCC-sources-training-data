import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._

object Futures extends App {
  val a = Future { 20 }
  val b = Future { 22 }
  val sum = for (x <- a; y <- b) yield x + y
  println(Await.result(sum, 2.seconds))
}
