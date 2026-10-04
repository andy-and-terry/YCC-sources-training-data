object BigNumberDemo {
  def factorial(n: Int): BigInt = (BigInt(1) to BigInt(n)).product

  def fibBig(n: Int): BigInt =
    (1 to n).foldLeft((BigInt(0), BigInt(1))) { case ((a, b), _) => (b, a + b) }._1

  def main(args: Array[String]): Unit = {
    println(factorial(25))
    println(fibBig(100))
    println(BigInt(2).pow(100))
    println(BigInt("123456789012345678901234567890") % 97)
    println(BigInt(48).gcd(BigInt(180)))
    println(BigInt(4).modPow(13, 497))
    println(BigInt(97).isProbablePrime(20))
    println(Long.MaxValue + 1)
    println(BigInt(Long.MaxValue) + 1)

    val a = BigDecimal("0.1")
    val b = BigDecimal("0.2")
    println(a + b == BigDecimal("0.3"))
    println(0.1 + 0.2 == 0.3)
    println(BigDecimal("10") / BigDecimal("3"))
    println(BigDecimal("2.345").setScale(2, BigDecimal.RoundingMode.HALF_UP))
    println(BigInt(255).toString(16))
  }
}
