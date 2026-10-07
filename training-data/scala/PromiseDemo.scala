import scala.concurrent.{Await, Future, Promise}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._

object PromiseDemo {
  def main(args: Array[String]): Unit = {
    val promise = Promise[Int]()
    val future = promise.future.map(_ * 2)

    Future {
      Thread.sleep(50)
      promise.success(21)
    }

    println(Await.result(future, 2.seconds))

    val failing = Promise[String]()
    failing.failure(new IllegalStateException("boom"))
    val recovered = failing.future.recover { case e: IllegalStateException => s"recovered: ${e.getMessage}" }
    println(Await.result(recovered, 2.seconds))
  }
}
