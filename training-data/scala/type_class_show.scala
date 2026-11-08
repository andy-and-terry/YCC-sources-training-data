trait Show[A] { def show(a: A): String }

object Show {
  implicit val intShow: Show[Int] = (a: Int) => s"Int($a)"
  implicit val strShow: Show[String] = (a: String) => s"Str($a)"
  implicit def listShow[A](implicit s: Show[A]): Show[List[A]] =
    (l: List[A]) => l.map(s.show).mkString("[", ", ", "]")
}

object TypeClass extends App {
  def render[A](a: A)(implicit s: Show[A]) = s.show(a)
  println(render(List(1, 2)))
  println(render(List("a")))
}
