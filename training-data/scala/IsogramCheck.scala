object IsogramCheck {
  def isIsogram(word: String): Boolean = {
    val letters = word.toLowerCase.filter(_.isLetter)
    letters.distinct.length == letters.length
  }

  def main(args: Array[String]): Unit =
    Seq("lumberjacks", "background", "six-year-old", "isograms").foreach(w => println(s"$w ${isIsogram(w)}"))
}
