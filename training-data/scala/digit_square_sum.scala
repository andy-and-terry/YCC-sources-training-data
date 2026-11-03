object DigitSquareSum {
  def digitSquareSum(n: Int): Int =
    math.abs(n).toString.map(c => (c - '0') * (c - '0')).sum

  def main(args: Array[String]): Unit = {
    println(digitSquareSum(123))
    println(digitSquareSum(-99))
  }
}
