object AddBinaryStrings {
  def addBinary(a: String, b: String): String = {
    val n = a.length max b.length
    val (x, y) = (a.reverse.padTo(n, '0'), b.reverse.padTo(n, '0'))
    val (digits, carry) = x.zip(y).foldLeft((List.empty[Char], 0)) { case ((acc, c), (p, q)) =>
      val s = (p - '0') + (q - '0') + c
      (('0' + s % 2).toChar :: acc, s / 2)
    }
    val all = if (carry > 0) '1' :: digits else digits
    all.mkString
  }

  def main(args: Array[String]): Unit =
    println(addBinary("1010", "1011")) // 10101
}
