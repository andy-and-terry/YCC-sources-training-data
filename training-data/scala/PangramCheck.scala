object PangramCheck {
  def isPangram(s: String): Boolean = s.toLowerCase.filter(_.isLetter).toSet.count(c => c >= 'a' && c <= 'z') == 26

  def main(args: Array[String]): Unit = {
    println(isPangram("The quick brown fox jumps over the lazy dog"))
    println(isPangram("Hello world"))
  }
}
