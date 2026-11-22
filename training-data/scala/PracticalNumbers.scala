// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
object PracticalNumbers {
  def isPractical(n: Int): Boolean = {
    var reach = 1L // bit i set <=> i is a subset sum
    for (d <- 1 to n if n % d == 0) reach |= reach << d
    val mask = (1L << (n + 1)) - 1
    (reach & mask) == mask
  }

  def main(args: Array[String]): Unit =
    println((1 to 40).filter(isPractical).mkString(" "))
}
