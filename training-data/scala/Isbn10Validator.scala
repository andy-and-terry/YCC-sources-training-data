object Isbn10Validator {
  def isValid(isbn: String): Boolean = {
    val s = isbn.filterNot(_ == '-')
    s.matches("""\d{9}[\dX]""") &&
      s.zipWithIndex.map { case (c, i) => (if (c == 'X') 10 else c.asDigit) * (10 - i) }.sum % 11 == 0
  }

  def main(args: Array[String]): Unit =
    Seq("3-598-21508-8", "3-598-21507-X", "3-598-21508-9").foreach(s => println(s"$s ${isValid(s)}"))
}
