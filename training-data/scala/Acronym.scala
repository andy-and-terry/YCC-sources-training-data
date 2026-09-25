object Acronym {
  def abbreviate(phrase: String): String =
    "[A-Za-z][A-Za-z']*".r.findAllIn(phrase).map(_.head.toUpper).mkString

  def main(args: Array[String]): Unit = {
    println(abbreviate("Portable Network Graphics"))
    println(abbreviate("Complementary metal-oxide semiconductor"))
  }
}
