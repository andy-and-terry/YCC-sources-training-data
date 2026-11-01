trait Show[A] { def show(a: A): String }

object Show {
  given Show[Int] with { def show(a: Int) = s"Int($a)" }
  given Show[String] with { def show(a: String) = s"Str($a)" }
  given [A](using s: Show[A]): Show[List[A]] with {
    def show(l: List[A]) = l.map(s.show).mkString("[", ",", "]")
  }
}

def render[A](a: A)(using s: Show[A]) = s.show(a)

@main def run() = println(render(List(1, 2, 3)))
