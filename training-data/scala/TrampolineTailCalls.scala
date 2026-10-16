import scala.util.control.TailCalls._

object TrampolineTailCalls {
  def isEven(n: Int): TailRec[Boolean] =
    if (n == 0) done(true) else tailcall(isOdd(n - 1))

  def isOdd(n: Int): TailRec[Boolean] =
    if (n == 0) done(false) else tailcall(isEven(n - 1))

  def sumTo(n: Long): TailRec[Long] =
    if (n == 0) done(0L) else tailcall(sumTo(n - 1)).map(_ + n)

  def main(args: Array[String]): Unit = {
    println(isEven(100000).result)
    println(isOdd(7).result)
    println(sumTo(50000).result)
  }
}
