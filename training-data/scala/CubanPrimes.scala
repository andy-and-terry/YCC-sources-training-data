object CubanPrimes extends App {
  def isPrime(n: Long): Boolean = n >= 2 && Iterator.from(2).map(_.toLong).takeWhile(i => i * i <= n).forall(n % _ != 0)

  val cuban = LazyList.from(1).map(y => 3L * y * y + 3 * y + 1).filter(isPrime).take(8)
  println(cuban.toList)
}
