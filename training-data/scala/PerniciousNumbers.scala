// Pernicious numbers: the popcount is prime.
object PerniciousNumbers {
  def isPrime(n: Int): Boolean =
    n >= 2 && (2 to n).takeWhile(d => d * d <= n).forall(n % _ != 0)

  def main(args: Array[String]): Unit =
    println((1 to 20).filter(n => isPrime(Integer.bitCount(n))).mkString(" "))
}
