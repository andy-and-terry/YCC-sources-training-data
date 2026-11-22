// Sophie Germain primes: p prime and 2p + 1 prime.
object SophieGermainPrimes {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)

  def main(args: Array[String]): Unit =
    println((2 until 100).filter(p => isPrime(p) && isPrime(2 * p + 1)).mkString(" "))
}
