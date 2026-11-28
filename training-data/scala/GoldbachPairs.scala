object GoldbachPairs extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  val n = 28
  for (p <- 2 to n / 2 if isPrime(p) && isPrime(n - p)) println(s"$p + ${n - p}")
}
