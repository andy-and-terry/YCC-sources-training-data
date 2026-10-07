// Implicit parameters and context bounds: how Scala threads "ambient"
// values (like an Ordering or a Monoid) through calls without every caller
// passing them explicitly.
trait Monoid[T] {
  def empty: T
  def combine(a: T, b: T): T
}

object Monoid {
  implicit val intAddMonoid: Monoid[Int] = new Monoid[Int] {
    def empty: Int = 0
    def combine(a: Int, b: Int): Int = a + b
  }

  implicit val stringConcatMonoid: Monoid[String] = new Monoid[String] {
    def empty: String = ""
    def combine(a: String, b: String): String = a + b
  }
}

object Combiner {
  // `implicit m: Monoid[T]` and the equivalent context bound `[T: Monoid]`
  // are the same feature; both are shown here.
  def combineAll[T](items: List[T])(implicit m: Monoid[T]): T =
    items.foldLeft(m.empty)(m.combine)

  def combineAllCtx[T: Monoid](items: List[T]): T = {
    val m = implicitly[Monoid[T]]
    items.foldLeft(m.empty)(m.combine)
  }

  // Custom ordering picked up implicitly, letting `describeMax` stay
  // generic over any type with an available Ordering.
  def describeMax[T](items: List[T])(implicit ord: Ordering[T]): String =
    items.max(ord).toString
}

object ImplicitParameterDemo {
  def main(args: Array[String]): Unit = {
    println(Combiner.combineAll(List(1, 2, 3, 4)))
    println(Combiner.combineAllCtx(List("a", "b", "c")))

    // A locally-scoped implicit Ordering overrides the default one just
    // for this call site.
    implicit val descending: Ordering[Int] = Ordering.Int.reverse
    println(Combiner.describeMax(List(3, 1, 4, 1, 5)))
  }
}
