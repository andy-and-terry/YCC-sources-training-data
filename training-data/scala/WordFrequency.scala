object WordFrequency {
  def wordFrequency(text: String): List[(String, Int)] = {
    text.toLowerCase.split("\\s+").groupBy(identity).view.mapValues(_.length).toList.sortBy(-_._2)
  }

  def main(args: Array[String]): Unit = {
    val text = "the quick brown fox jumps over the lazy dog the fox runs"
    wordFrequency(text).foreach { case (word, count) => println(s"$word: $count") }
  }
}
