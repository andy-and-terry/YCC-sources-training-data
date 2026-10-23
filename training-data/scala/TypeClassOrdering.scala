trait Show[A] {
  def show(a: A): String
}

object Show {
  implicit val intShow: Show[Int] = (a: Int) => s"Int($a)"
  implicit val strShow: Show[String] = (a: String) => s"Str($a)"
  implicit def listShow[A](implicit s: Show[A]): Show[List[A]] =
    (xs: List[A]) => xs.map(s.show).mkString("[", ", ", "]")
}

object TypeClassOrdering {
  def render[A](a: A)(implicit s: Show[A]): String = s.show(a)

  def main(args: Array[String]): Unit = {
    println(render(42))
    println(render(List("a", "b")))
  }
}
