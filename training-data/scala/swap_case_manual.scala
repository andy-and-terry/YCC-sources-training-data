object SwapCaseManual {
  def swapCase(s: String): String =
    s.map(c => if (c.isUpper) c.toLower else c.toUpper)

  def main(args: Array[String]): Unit = println(swapCase("Hello World 42"))
}
