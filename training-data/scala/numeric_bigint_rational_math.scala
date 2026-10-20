object NumericBigIntRationalMath {
  def main(args: Array[String]): Unit = {
    println(BigInt(2).pow(100) + " " + BigInt("123456789012345678901234567890") % 97)
    println(BigDecimal("0.1") + BigDecimal("0.2") + " " + (BigDecimal(1) / 3).setScale(5, BigDecimal.RoundingMode.HALF_UP))
    println(math.sqrt(2) + " " + math.pow(2, 0.5) + " " + math.abs(-3) + " " + math.floor(-1.5) + " " + math.round(2.5))
    println(10 / 3 + " " + 10 % 3 + " " + 10.0 / 3 + " " + (10 / 3.0).toInt + " " + -7 / 2 + " " + math.floorMod(-7, 3))
    println(Int.MaxValue + 1 + " " + Long.MaxValue + " " + (Int.MaxValue.toLong + 1))
    println(0.1 + 0.2 == 0.3)
    println((1 to 5).sum)
    println(BigInt(97).isProbablePrime(10) + " " + BigInt(48).gcd(BigInt(18)))
  }
}
