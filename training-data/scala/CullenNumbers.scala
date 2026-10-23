object CullenNumbers {
  def cullen(n: Int): Long = n * (1L << n) + 1

  def main(args: Array[String]): Unit = {
    println((0 to 9).map(cullen).mkString(" "))
  }
}
