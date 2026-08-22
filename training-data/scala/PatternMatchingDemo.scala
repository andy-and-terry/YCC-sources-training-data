object PatternMatchingDemo {
  def describe(x: Any): String = x match {
    case 0 => "zero"
    case n: Int if n > 0 => "positive int"
    case n: Int => "negative int"
    case s: String => s"string of length ${s.length}"
    case list: List[_] => s"list with ${list.length} elements"
    case _ => "unknown"
  }

  def main(args: Array[String]): Unit = {
    List(0, 5, -3, "hello", List(1, 2, 3), 3.14).foreach(x => println(describe(x)))
  }
}
