object ExcelColumnTitle {
  def title(n: Int): String =
    if (n == 0) "" else title((n - 1) / 26) + ('A' + (n - 1) % 26).toChar

  def main(args: Array[String]): Unit =
    println(s"${title(28)} ${title(701)}") // AB ZY
}
