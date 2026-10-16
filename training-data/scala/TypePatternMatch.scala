object TypePatternMatch {
  def describe(x: Any): String = x match {
    case i: Int if i < 0 => s"negative int $i"
    case i: Int => s"int $i"
    case d: Double => f"double $d%.2f"
    case s: String if s.isEmpty => "empty string"
    case s: String => s"string of ${s.length}"
    case (a, b) => s"pair of ${describe(a)} and ${describe(b)}"
    case l: List[_] => s"list with ${l.size} items"
    case Some(v) => s"some(${describe(v)})"
    case None => "nothing"
    case _ => "unknown"
  }

  def main(args: Array[String]): Unit = {
    List(-3, 7, 2.5, "", "hello", (1, "a"), List(1, 2), Some(4), None, 'c')
      .map(describe)
      .foreach(println)
  }
}
