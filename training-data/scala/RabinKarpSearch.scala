object RabinKarpSearch {
  val base: Long = 256
  val modulus: Long = 1000000007L

  def search(text: String, pattern: String): List[Int] = {
    val n = text.length
    val m = pattern.length
    if (m == 0 || m > n) return Nil

    val highOrder = (1 until m).foldLeft(1L) { (acc, _) => (acc * base) % modulus }

    def hashOf(s: String, start: Int, len: Int): Long = {
      (start until start + len).foldLeft(0L) { (h, i) => (h * base + s.charAt(i)) % modulus }
    }

    val patternHash = hashOf(pattern, 0, m)
    val matches = scala.collection.mutable.ListBuffer[Int]()
    var textHash = hashOf(text, 0, m)

    for (i <- 0 to n - m) {
      if (textHash == patternHash && text.substring(i, i + m) == pattern) {
        matches += i
      }
      if (i < n - m) {
        val leaving = text.charAt(i)
        val entering = text.charAt(i + m)
        textHash = ((textHash - leaving * highOrder % modulus + modulus) * base + entering) % modulus
      }
    }

    matches.toList
  }

  def main(args: Array[String]): Unit = {
    println(search("abracadabra", "abra"))
    println(search("aaaaa", "aa"))
    println(search("hello world", "xyz"))
  }
}
