object StreamDemo {
  def fibs: LazyList[BigInt] = {
    def loop(a: BigInt, b: BigInt): LazyList[BigInt] = a #:: loop(b, a + b)
    loop(0, 1)
  }

  def main(args: Array[String]): Unit = {
    println(fibs.take(11).toList)
  }
}
