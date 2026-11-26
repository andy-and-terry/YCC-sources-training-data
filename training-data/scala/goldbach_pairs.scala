// Goldbach partitions of 100; expect 6.
object GoldbachPairs extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  val pairs = (2 to 50).filter(p => isPrime(p) && isPrime(100 - p)).map(p => (p, 100 - p))
  println(s"${pairs.size} $pairs")
}
