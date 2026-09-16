object KMPSearch {
  def buildLps(pattern: String): Array[Int] = {
    val lps = Array.fill(pattern.length)(0)
    var len = 0
    var i = 1
    while (i < pattern.length) {
      if (pattern(i) == pattern(len)) {
        len += 1
        lps(i) = len
        i += 1
      } else if (len != 0) {
        len = lps(len - 1)
      } else {
        lps(i) = 0
        i += 1
      }
    }
    lps
  }

  def search(text: String, pattern: String): Int = {
    if (pattern.isEmpty) return 0
    val lps = buildLps(pattern)
    var i = 0
    var j = 0
    while (i < text.length) {
      if (text(i) == pattern(j)) {
        i += 1
        j += 1
        if (j == pattern.length) return i - j
      } else if (j > 0) {
        j = lps(j - 1)
      } else {
        i += 1
      }
    }
    -1
  }

  def main(args: Array[String]): Unit = {
    println(search("abxabcabcaby", "abcaby"))
    println(search("hello world", "xyz"))
  }
}
