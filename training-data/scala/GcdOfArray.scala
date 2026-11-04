import scala.annotation.tailrec

object GcdOfArray extends App {
  @tailrec def gcd(a: Int, b: Int): Int = if (b == 0) a.abs else gcd(b, a % b)
  def gcdAll(nums: Int*): Int = nums.foldLeft(0)(gcd)

  println(gcdAll(12, 18, 24))
  println(gcdAll(7, 13))
}
