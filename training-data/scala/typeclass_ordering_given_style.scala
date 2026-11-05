trait Show[A] { def show(a: A): String }

object Show {
  implicit val intShow: Show[Int] = (a: Int) => s"int:$a"
  implicit val strShow: Show[String] = (a: String) => s"str:$a"
}

object TypeclassDemo extends App {
  def render[A](a: A)(implicit s: Show[A]): String = s.show(a)
  println(render(5))
  println(render("x"))
}
