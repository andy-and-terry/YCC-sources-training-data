object Emirps {
  def isPrime(n: Long): Boolean = n >= 2 && Iterator.iterate(2L)(_ + 1).takeWhile(d => d * d <= n).forall(n % _ != 0)

  def main(args: Array[String]): Unit = {
    val out = Iterator.from(2).map(_.toLong).filter { n =>
      val r = n.toString.reverse.toLong
      r != n && isPrime(n) && isPrime(r)
    }.take(10).toList
    println(out.mkString(" ")) // 13 17 31 37 71 73 79 97 107 113
  }
}
