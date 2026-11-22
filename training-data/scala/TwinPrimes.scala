// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
object TwinPrimes {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)

  def main(args: Array[String]): Unit =
    println((2 until 100).filter(p => isPrime(p) && isPrime(p + 2)).mkString(" "))
}
