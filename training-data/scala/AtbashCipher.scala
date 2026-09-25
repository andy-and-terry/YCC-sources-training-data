object AtbashCipher {
  def decode(text: String): String =
    text.toLowerCase.filter(_.isLetterOrDigit).map(c => if (c.isLetter) ('z' - (c - 'a')).toChar else c)

  def encode(text: String): String = decode(text).grouped(5).mkString(" ")

  def main(args: Array[String]): Unit = {
    val e = encode("The quick brown fox")
    println(s"$e -> ${decode(e)}")
  }
}
