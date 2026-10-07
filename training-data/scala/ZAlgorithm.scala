object ZAlgorithm {
  def zArray(s: String): Array[Int] = {
    val n = s.length
    val z = Array.fill(n)(0)
    var left = 0
    var right = 0

    for (i <- 1 until n) {
      if (i <= right) {
        z(i) = math.min(right - i + 1, z(i - left))
      }
      while (i + z(i) < n && s(z(i)) == s(i + z(i))) {
        z(i) += 1
      }
      if (i + z(i) - 1 > right) {
        left = i
        right = i + z(i) - 1
      }
    }
    z
  }

  def search(text: String, pattern: String): List[Int] = {
    val combined = pattern + "$" + text
    val z = zArray(combined)
    val m = pattern.length
    z.indices.filter(i => z(i) == m).map(i => i - m - 1).toList
  }

  def main(args: Array[String]): Unit = {
    println(search("abxabcabcaby", "abcaby"))
  }
}
