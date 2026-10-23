object IterateUnfoldDemo {
  def main(args: Array[String]): Unit = {
    println(List.iterate(1, 8)(_ * 2))
    println(Iterator.iterate(100)(_ / 2).takeWhile(_ > 0).toList)

    val collatz = Iterator.iterate(27L)(n => if (n % 2 == 0) n / 2 else 3 * n + 1)
      .takeWhile(_ != 1L)
      .length
    println(s"collatz steps for 27: $collatz")

    val fibs = LazyList.unfold((0, 1)) { case (a, b) => Some((a, (b, a + b))) }
    println(fibs.take(10).toList)

    val digits = List.unfold(9042) { n =>
      if (n == 0) None else Some((n % 10, n / 10))
    }
    println(digits.reverse)

    println(List.tabulate(5)(i => i * i))
    println(List.fill(3)("ab"))
  }
}
