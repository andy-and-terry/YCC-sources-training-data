import scala.annotation.tailrec

object TailRecursionAnnotation {
  @tailrec def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
  @tailrec def sum(xs: List[Int], acc: Long = 0): Long = xs match {
    case Nil => acc
    case h :: t => sum(t, acc + h)
  }
  def fact(n: Int): BigInt = {
    @tailrec def go(i: Int, acc: BigInt): BigInt = if (i <= 1) acc else go(i - 1, acc * i)
    go(n, 1)
  }

  def main(args: Array[String]): Unit = {
    println(gcd(84, 36))
    println(sum((1 to 100000).toList))
    println(fact(25))
  }
}
