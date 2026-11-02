trait Show[A] { def show(a: A): String }
object Show {
  implicit val intShow: Show[Int] = (a: Int) => s"int($a)"
  implicit val strShow: Show[String] = (a: String) => s"str($a)"
}
object TypeClassShowX2 extends App {
  def render[A](a: A)(implicit s: Show[A]) = s.show(a)
  println(render(1) + render("x"))
}
