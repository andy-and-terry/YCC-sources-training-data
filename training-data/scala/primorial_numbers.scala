// Primorials up to 1e6, including 1; expect 8.
object PrimorialNumbers extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  val primes = LazyList.from(2).filter(isPrime)
  val products = primes.scanLeft(1L)(_ * _).takeWhile(_ <= 1000000L)
  println(s"${products.size} ${products.toList}")
}
