object LuhnCheck {
  def isValid(input: String): Boolean = {
    val s = input.filterNot(_ == ' ')
    s.length > 1 && s.forall(_.isDigit) && {
      val sum = s.reverse.zipWithIndex.map { case (c, i) =>
        val d = c.asDigit
        if (i % 2 == 1) { val x = d * 2; if (x > 9) x - 9 else x } else d
      }.sum
      sum % 10 == 0
    }
  }

  def main(args: Array[String]): Unit =
    println(s"${isValid("4539 3195 0343 6467")} ${isValid("8273 1232 7352 0569")}")
}
