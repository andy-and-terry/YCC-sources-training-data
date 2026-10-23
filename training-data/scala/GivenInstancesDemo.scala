// Scala 3: given instances and using clauses replace implicit values.
trait Show[A]:
  def show(a: A): String

object Show:
  given Show[Int] with
    def show(a: Int): String = s"Int($a)"

  given Show[String] = new Show[String]:
    def show(a: String): String = "\"" + a + "\""

  given [A](using s: Show[A]): Show[List[A]] with
    def show(xs: List[A]): String = xs.map(s.show).mkString("[", ", ", "]")

def render[A](a: A)(using s: Show[A]): String = s.show(a)

case class Config(verbose: Boolean)

def log(msg: String)(using cfg: Config): Unit =
  if cfg.verbose then println(s"[verbose] $msg") else println(msg)

@main def givenInstancesDemo(): Unit =
  println(render(42))
  println(render("hi"))
  println(render(List(1, 2, 3)))
  println(render(List(List("a"), List("b", "c"))))

  given Config = Config(verbose = true)
  log("starting")
  log("done")(using Config(verbose = false))

  println(summon[Show[Int]].show(7))
