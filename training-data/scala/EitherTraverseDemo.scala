object EitherTraverseDemo {
  def parseAge(s: String): Either[String, Int] =
    s.toIntOption.toRight(s"'$s' is not a number").filterOrElse(_ >= 0, s"'$s' is negative")

  def traverse[A, B, E](xs: List[A])(f: A => Either[E, B]): Either[E, List[B]] =
    xs.foldRight(Right(Nil): Either[E, List[B]]) { (x, acc) =>
      for (b <- f(x); bs <- acc) yield b :: bs
    }

  def main(args: Array[String]): Unit = {
    println(traverse(List("10", "20", "30"))(parseAge))
    println(traverse(List("10", "x", "-5"))(parseAge))
    println(parseAge("-3"))
    val (errs, oks) = List("1", "b", "3").map(parseAge).partitionMap(identity)
    println(errs)
    println(oks)
    println(parseAge("7").map(_ * 2).getOrElse(0))
  }
}
