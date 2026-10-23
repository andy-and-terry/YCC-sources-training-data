// Pattern alternatives (|), guards (if), and binders (@) in match expressions.
def describe(x: Any): String = x match
  case 0 | 1 => "zero or one"
  case n: Int if n < 0 => s"negative int $n"
  case n: Int if n % 2 == 0 => s"even int $n"
  case n: Int => s"odd int $n"
  case "yes" | "y" | "true" => "affirmative"
  case s: String if s.isEmpty => "empty string"
  case s @ ("a" | "b") => s"letter $s"
  case (a: Int, b: Int) if a == b => s"pair of equals ($a)"
  case head :: Nil => s"singleton list of $head"
  case list @ (_ :: _ :: _) => s"list of ${list.length}"
  case _ => "something else"

@main def patternAlternativesGuards(): Unit =
  List[Any](1, -4, 8, 9, "y", "", "a", (3, 3), List(7), List(1, 2, 3), 2.5)
    .foreach(v => println(s"$v -> ${describe(v)}"))
