object TypeclassOrderingShow {
  trait Show[A] { def show(a: A): String }
  object Show {
    implicit val intShow: Show[Int] = (a: Int) => s"Int($a)"
    implicit val strShow: Show[String] = (a: String) => "\"" + a + "\""
    implicit def listShow[A](implicit s: Show[A]): Show[List[A]] = (l: List[A]) => l.map(s.show).mkString("[", ", ", "]")
  }
  def display[A](a: A)(implicit s: Show[A]): String = s.show(a)

  case class P(name: String, age: Int)

  def main(args: Array[String]): Unit = {
    println(display(List(1, 2)))
    println(display(List("a")))
    implicit val byAge: Ordering[P] = Ordering.by(_.age)
    println(List(P("a", 30), P("b", 20)).sorted)
    println(List(P("a", 30), P("b", 20)).max.name)
  }
}
