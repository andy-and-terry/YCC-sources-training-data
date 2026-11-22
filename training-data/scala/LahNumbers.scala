// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
object LahNumbers {
  def fact(n: Int): Long = if (n <= 1) 1L else n * fact(n - 1)
  def comb(n: Int, k: Int): Long = fact(n) / (fact(k) * fact(n - k))

  def main(args: Array[String]): Unit = {
    val n = 5
    println((1 to n).map(k => comb(n - 1, k - 1) * fact(n) / fact(k)).mkString(" "))
  }
}
