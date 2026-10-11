object ParserCombinatorMini {
  type Parser[A] = String => Option[(A, String)]

  def char(c: Char): Parser[Char] = s => if (s.nonEmpty && s.head == c) Some((c, s.tail)) else None

  def digit: Parser[Char] = s => if (s.nonEmpty && s.head.isDigit) Some((s.head, s.tail)) else None

  def many[A](p: Parser[A]): Parser[List[A]] = s => p(s) match {
    case Some((a, rest)) => many(p)(rest).map { case (as, r) => (a :: as, r) }
    case None => Some((Nil, s))
  }

  def number: Parser[Int] = s => many(digit)(s) match {
    case Some((ds, rest)) if ds.nonEmpty => Some((ds.mkString.toInt, rest))
    case _ => None
  }

  def sepBy[A](p: Parser[A], sep: Parser[Char]): Parser[List[A]] = s => p(s) match {
    case None => Some((Nil, s))
    case Some((a, rest)) =>
      many((in: String) => sep(in).flatMap { case (_, r) => p(r) })(rest).map { case (as, r) => (a :: as, r) }
  }

  def main(args: Array[String]): Unit = {
    println(number("123abc"))
    println(number("abc"))
    println(sepBy(number, char(','))("1,22,333;rest"))
    println(sepBy(number, char(','))(""))
  }
}
