object RomanNumerals {
  val values = List(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  val symbols = List("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")

  def intToRoman(num: Int): String = {
    var n = num
    val sb = new StringBuilder
    for ((value, symbol) <- values.zip(symbols)) {
      while (n >= value) {
        sb.append(symbol)
        n -= value
      }
    }
    sb.toString
  }

  def main(args: Array[String]): Unit = {
    println(intToRoman(1994))
  }
}
