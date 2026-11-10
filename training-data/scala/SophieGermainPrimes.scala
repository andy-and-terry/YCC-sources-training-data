object SophieGermainPrimes {
  def isPrime(n: Long): Boolean = n >= 2 && Iterator.iterate(2L)(_ + 1).takeWhile(d => d * d <= n).forall(n % _ != 0)

  def main(args: Array[String]): Unit = {
    val found = Iterator.from(2).map(_.toLong).filter(p => isPrime(p) && isPrime(2 * p + 1)).take(10).toList
    println(found.mkString(" ")) // 2 3 5 11 23 29 41 53 83 89
  }
}
