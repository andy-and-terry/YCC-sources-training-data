object SmithNumbers {
  def digitSum(n: Int): Int = n.toString.map(_ - '0').sum

  def primeFactors(n: Int, p: Int = 2): List[Int] =
    if (n < 2) Nil
    else if (p * p > n) List(n)
    else if (n % p == 0) p :: primeFactors(n / p, p)
    else primeFactors(n, p + 1)

  def isSmith(n: Int): Boolean = {
    val factors = primeFactors(n)
    factors.length > 1 && factors.map(digitSum).sum == digitSum(n)
  }

  def main(args: Array[String]): Unit = {
    println((2 until 100).filter(isSmith).mkString(" "))
  }
}
