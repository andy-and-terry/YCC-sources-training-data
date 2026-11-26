// Circular primes below 100; expect 13.
object CircularPrimes extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def circular(n: Int): Boolean = {
    val s = n.toString
    s.indices.forall(i => isPrime((s.drop(i) + s.take(i)).toInt))
  }
  println((2 until 100).count(circular))
}
