// Sexy primes below 100; expect 16 pairs.
object SexyPrimes extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  println((2 until 100).count(p => isPrime(p) && isPrime(p + 6)))
}
