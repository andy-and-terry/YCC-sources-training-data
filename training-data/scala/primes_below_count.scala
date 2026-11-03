object PrimesBelowCount {
  def countPrimesBelow(n: Int): Int = {
    if (n < 3) return 0
    val composite = Array.fill(n)(false)
    for (i <- 2 until n if !composite(i); j <- (i.toLong * i) until n by i) composite(j.toInt) = true
    (2 until n).count(!composite(_))
  }

  def main(args: Array[String]): Unit = println(countPrimesBelow(100))
}
