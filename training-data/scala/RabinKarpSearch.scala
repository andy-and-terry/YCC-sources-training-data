object RabinKarpSearch {
  val base = 256
  val prime = 101

  def search(text: String, pattern: String): List[Int] = {
    val n = text.length
    val m = pattern.length
    if (m == 0 || m > n) return Nil

    var patternHash = 0
    var textHash = 0
    var h = 1
    for (_ <- 0 until m - 1) h = (h * base) % prime

    for (i <- 0 until m) {
      patternHash = (base * patternHash + pattern(i)) % prime
      textHash = (base * textHash + text(i)) % prime
    }

    val matches = scala.collection.mutable.ListBuffer[Int]()
    for (i <- 0 to n - m) {
      if (patternHash == textHash && text.substring(i, i + m) == pattern) {
        matches += i
      }
      if (i < n - m) {
        textHash = (base * (textHash - text(i) * h) + text(i + m)) % prime
        if (textHash < 0) textHash += prime
      }
    }
    matches.toList
  }

  def main(args: Array[String]): Unit = {
    val text = "abxabcabcaby"
    val pattern = "abc"
    println(search(text, pattern))
  }
}
