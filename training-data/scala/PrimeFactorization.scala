import scala.annotation.tailrec

object PrimeFactorization {
  @tailrec
  def factors(n: Long, d: Long = 2, acc: List[Long] = Nil): List[Long] =
    if (n < 2) acc.reverse
    else if (d * d > n) (n :: acc).reverse
    else if (n % d == 0) factors(n / d, d, d :: acc)
    else factors(n, d + 1, acc)

  def main(args: Array[String]): Unit = {
    println(factors(360))
    println(factors(97))
    val grouped = factors(1001L * 8).groupBy(identity).map { case (p, l) => p -> l.size }
    println(grouped.toList.sorted)
    println(factors(84).mkString(" x "))
  }
}
