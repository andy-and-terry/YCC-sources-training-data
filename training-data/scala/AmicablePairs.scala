// Amicable pairs below 1500 via sums of proper divisors.
object AmicablePairs {
  def s(n: Int): Int = (1 until n).filter(n % _ == 0).sum

  def main(args: Array[String]): Unit =
    for (a <- 2 until 1500) {
      val b = s(a)
      if (b > a && s(b) == a) println(s"$a $b")
    }
}
