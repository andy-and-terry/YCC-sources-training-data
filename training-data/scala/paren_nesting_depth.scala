// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
def maxDepth(s: String): Int =
  val (depth, best, ok) = s.foldLeft((0, 0, true)) { case ((d, b, ok), ch) =>
    ch match
      case '(' => (d + 1, math.max(b, d + 1), ok)
      case ')' => (d - 1, b, ok && d - 1 >= 0)
      case _   => (d, b, ok)
  }
  if ok && depth == 0 then best else -1

@main def parenNestingDepth(): Unit =
  println(s"${maxDepth("(1+(2*(3)))")} ${maxDepth("(()")}")
