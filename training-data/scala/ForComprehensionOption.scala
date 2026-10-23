object ForComprehensionOption {
  def parse(s: String): Option[Int] = s.toIntOption

  def main(args: Array[String]): Unit = {
    val sum = for {
      a <- parse("10")
      b <- parse("32")
    } yield a + b
    println(sum)

    val bad = for {
      a <- parse("10")
      b <- parse("x")
    } yield a + b
    println(bad)
  }
}
