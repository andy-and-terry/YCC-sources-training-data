import scala.annotation.tailrec

object Gcd extends App {
  @tailrec def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
  println(gcd(48, 18))
}
