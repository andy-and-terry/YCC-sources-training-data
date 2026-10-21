object PellNumbers {
  // Lazy list of Pell numbers: P(n) = 2*P(n-1) + P(n-2)
  val pell: LazyList[BigInt] = BigInt(0) #:: BigInt(1) #:: pell.zip(pell.tail).map { case (a, b) => 2 * b + a }

  def main(args: Array[String]): Unit =
    pell.take(15).zipWithIndex.foreach { case (p, i) => println(s"P($i) = $p") }
}
