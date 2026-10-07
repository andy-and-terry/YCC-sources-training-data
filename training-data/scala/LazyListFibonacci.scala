object LazyListFibonacci {
  val fibs: LazyList[BigInt] = BigInt(0) #:: BigInt(1) #:: fibs.zip(fibs.tail).map { case (a, b) => a + b }

  def primes(s: LazyList[Int] = LazyList.from(2)): LazyList[Int] =
    s.head #:: primes(s.tail.filter(_ % s.head != 0))

  def main(args: Array[String]): Unit = {
    println(fibs.take(10).toList)
    println(fibs(90))
    println(primes().take(8).toList)
    println(LazyList.iterate(1)(_ * 2).takeWhile(_ < 100).toList)
  }
}
