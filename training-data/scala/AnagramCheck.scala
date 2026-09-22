object AnagramCheck {
  def isAnagram(a: String, b: String): Boolean = {
    val normalize = (s: String) => s.toLowerCase.filterNot(_.isWhitespace).sorted
    normalize(a) == normalize(b)
  }

  def main(args: Array[String]): Unit = {
    val pairs = List(("listen", "silent"), ("hello", "world"), ("Dormitory", "dirty room"))
    for ((a, b) <- pairs) println(s"$a / $b -> ${isAnagram(a, b)}")
  }
}
