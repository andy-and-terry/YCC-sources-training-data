// Rabin-Karp substring search: a rolling polynomial hash lets each window
// be compared in O(1) amortized, falling back to a direct character check
// only when hashes collide.
object RabinKarpSearch {
  private val base = 256
  private val modulus = 1000000007L

  def search(text: String, pattern: String): List[Int] = {
    val n = text.length
    val m = pattern.length
    if (m == 0 || m > n) return Nil

    var highOrder = 1L
    for (_ <- 1 until m) highOrder = (highOrder * base) % modulus

    var patternHash = 0L
    var windowHash = 0L
    for (i <- 0 until m) {
      patternHash = (patternHash * base + pattern(i)) % modulus
      windowHash = (windowHash * base + text(i)) % modulus
    }

    val matches = scala.collection.mutable.ListBuffer[Int]()
    var i = 0
    while (i <= n - m) {
      if (windowHash == patternHash && text.substring(i, i + m) == pattern) {
        matches += i
      }
      if (i < n - m) {
        windowHash = ((windowHash - text(i) * highOrder % modulus + modulus) % modulus
          * base + text(i + m)) % modulus
      }
      i += 1
    }
    matches.toList
  }

  def main(args: Array[String]): Unit = {
    println(search("abxabcabcaby", "abc"))
    println(search("aaaaa", "aa"))
    println(search("hello world", "xyz"))
  }
}
