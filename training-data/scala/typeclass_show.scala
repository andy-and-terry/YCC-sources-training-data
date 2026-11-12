object Typeclass extends App {
  trait Show[A] { def show(a: A): String }
  given Show[Int] with { def show(a: Int) = s"Int($a)" }
  given Show[String] with { def show(a: String) = s"Str($a)" }
  def render[A](a: A)(using s: Show[A]) = s.show(a)
  println(render(5)); println(render("x"))
}
