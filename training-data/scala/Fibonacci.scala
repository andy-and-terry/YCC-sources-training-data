object Fibonacci {
  def fib(n: Int): BigInt = {
    @scala.annotation.tailrec
    def loop(i: Int, a: BigInt, b: BigInt): BigInt =
      if (i == 0) a else loop(i - 1, b, a + b)
    loop(n, 0, 1)
  }

  def main(args: Array[String]): Unit = {
    (0 to 10).foreach(n => print(s"${fib(n)} "))
    println()
  }
}
