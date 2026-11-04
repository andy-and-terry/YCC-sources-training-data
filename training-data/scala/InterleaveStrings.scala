object InterleaveStrings extends App {
  def interleave(parts: String*): String = {
    val longest = parts.map(_.length).maxOption.getOrElse(0)
    (for (i <- 0 until longest; p <- parts if i < p.length) yield p(i)).mkString
  }
  println(interleave("abc", "12345"))
  println(interleave("ab", "cd", "efg"))
}
