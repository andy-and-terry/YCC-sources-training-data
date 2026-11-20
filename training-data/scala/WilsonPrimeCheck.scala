// Wilson's theorem primality test.
object WilsonPrimeCheck {
  def wilson(n: Int): Boolean = n >= 2 && (2 until n).foldLeft(1L)((f, i) => f * i % n) == n - 1
  def main(args: Array[String]): Unit = println((2 until 20).filter(wilson))
}
