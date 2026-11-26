// Twin primes below 100; expect 8.
object TwinPrimes extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  println((2 until 100).count(p => isPrime(p) && isPrime(p + 2)))
}
