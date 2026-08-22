import scala.annotation.tailrec

object TailRecFactorial {
  @tailrec
  def factorial(n: Long, acc: Long = 1): Long =
    if (n <= 1) acc else factorial(n - 1, n * acc)

  def main(args: Array[String]): Unit = {
    (0 to 10).foreach(n => println(factorial(n)))
  }
}
