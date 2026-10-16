object MonoidFoldMap {
  trait Monoid[A] {
    def empty: A
    def combine(a: A, b: A): A
  }

  val intSum: Monoid[Int] = new Monoid[Int] {
    def empty = 0
    def combine(a: Int, b: Int) = a + b
  }
  val strConcat: Monoid[String] = new Monoid[String] {
    def empty = ""
    def combine(a: String, b: String) = a + b
  }
  def listMonoid[A]: Monoid[List[A]] = new Monoid[List[A]] {
    def empty = Nil
    def combine(a: List[A], b: List[A]) = a ++ b
  }

  def foldMap[A, B](xs: List[A])(f: A => B)(m: Monoid[B]): B =
    xs.foldLeft(m.empty)((acc, x) => m.combine(acc, f(x)))

  def main(args: Array[String]): Unit = {
    println(foldMap(List(1, 2, 3, 4))(identity)(intSum))
    println(foldMap(List("a", "b", "c"))(_.toUpperCase)(strConcat))
    println(foldMap(List(1, 2, 3))(x => List(x, x))(listMonoid[Int]))
    println(foldMap(List("hello", "to", "scala"))(_.length)(intSum))
  }
}
