object LongestPalindromicSubstring {
  def longestPalindrome(s: String): String = {
    if (s.isEmpty) return ""

    def expand(left: Int, right: Int): (Int, Int) = {
      var l = left
      var r = right
      while (l >= 0 && r < s.length && s(l) == s(r)) {
        l -= 1
        r += 1
      }
      (l + 1, r - 1)
    }

    var start = 0
    var end = 0
    for (i <- s.indices) {
      val (l1, r1) = expand(i, i)
      if (r1 - l1 > end - start) { start = l1; end = r1 }
      val (l2, r2) = expand(i, i + 1)
      if (r2 - l2 > end - start) { start = l2; end = r2 }
    }
    s.substring(start, end + 1)
  }

  def main(args: Array[String]): Unit = {
    println(longestPalindrome("babad"))
    println(longestPalindrome("cbbd"))
  }
}
