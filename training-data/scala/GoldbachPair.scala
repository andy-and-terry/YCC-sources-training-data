// Goldbach pair returning an Option.
object GoldbachPair {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def goldbach(n: Int): Option[(Int, Int)] =
    (2 to n / 2).find(p => isPrime(p) && isPrime(n - p)).map(p => (p, n - p))
  def main(args: Array[String]): Unit = println(goldbach(28))
}
