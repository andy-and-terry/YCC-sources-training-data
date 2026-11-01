// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
object RuthAaronPairs {
  def sopfr(start: Int): Int = {
    var n = start
    var total = 0
    var p = 2
    while (p * p <= n) {
      while (n % p == 0) { total += p; n /= p }
      p += 1
    }
    total + (if (n > 1) n else 0)
  }

  def main(args: Array[String]): Unit =
    println((2 until 110).filter(n => sopfr(n) == sopfr(n + 1)).mkString(" "))
}
