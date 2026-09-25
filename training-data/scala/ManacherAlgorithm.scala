object ManacherAlgorithm {
  def longestPalindrome(s: String): String = {
    if (s.isEmpty) return ""

    val t = "^#" + s.toCharArray.mkString("#") + "#$"
    val n = t.length
    val radius = Array.fill(n)(0)
    var center = 0
    var right = 0

    for (i <- 1 until n - 1) {
      if (i < right) radius(i) = math.min(right - i, radius(2 * center - i))
      while (t(i + radius(i) + 1) == t(i - radius(i) - 1)) radius(i) += 1
      if (i + radius(i) > right) {
        center = i
        right = i + radius(i)
      }
    }

    val (maxLen, centerIndex) = radius.zipWithIndex.maxBy(_._1)
    val start = (centerIndex - maxLen) / 2
    s.substring(start, start + maxLen)
  }

  def main(args: Array[String]): Unit = {
    println(longestPalindrome("babad"))
    println(longestPalindrome("cbbd"))
    println(longestPalindrome("forgeeksskeegfor"))
  }
}
