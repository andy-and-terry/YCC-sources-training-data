object RabinKarpSearch {
  def search(text: String, pattern: String): List[Int] = {
    val n = text.length
    val m = pattern.length
    if (m == 0 || m > n) return Nil

    val base = 256L
    val mod = 1000000007L

    var highOrder = 1L
    for (_ <- 1 until m) highOrder = (highOrder * base) % mod

    var patternHash = 0L
    var windowHash = 0L
    for (i <- 0 until m) {
      patternHash = (patternHash * base + pattern(i)) % mod
      windowHash = (windowHash * base + text(i)) % mod
    }

    var matches = List[Int]()
    for (i <- 0 to n - m) {
      if (patternHash == windowHash && text.substring(i, i + m) == pattern) {
        matches = matches :+ i
      }
      if (i < n - m) {
        windowHash = ((windowHash - text(i) * highOrder % mod + mod) * base + text(i + m)) % mod
      }
    }
    matches
  }

  def main(args: Array[String]): Unit = {
    println(search("abxabcabcaby", "abc"))
    println(search("aaaaa", "aa"))
    println(search("hello", "xyz"))
  }
}
