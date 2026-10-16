object SeqPatternMatch {
  def describe(xs: Seq[Int]): String = xs match {
    case Seq() => "empty"
    case Seq(x) => s"single $x"
    case Seq(a, b) => s"pair $a,$b"
    case Seq(first, _*) if first < 0 => "starts negative"
    case Seq(first, rest @ _*) => s"first $first then ${rest.length} more"
  }

  def lastTwo[A](xs: List[A]): Option[(A, A)] = xs match {
    case _ :+ a :+ b => Some((a, b))
    case _ => None
  }

  def main(args: Array[String]): Unit = {
    println(describe(Nil))
    println(describe(List(4)))
    println(describe(Vector(1, 2)))
    println(describe(List(-1, 2, 3)))
    println(describe(Array(5, 6, 7, 8)))
    println(lastTwo(List(1, 2, 3, 4)))
    println(lastTwo(List(1)))
    val head :: second :: _ = List(10, 20, 30)
    println(head + second)
  }
}
