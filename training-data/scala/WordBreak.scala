object WordBreak {
  def canBreak(s: String, dict: Set[String]): Boolean = {
    val n = s.length
    val dp = Array.fill(n + 1)(false)
    dp(0) = true
    for (i <- 1 to n; j <- 0 until i if !dp(i)) {
      if (dp(j) && dict.contains(s.substring(j, i))) dp(i) = true
    }
    dp(n)
  }

  def main(args: Array[String]): Unit = {
    val dict = Set("leet", "code", "scala", "is", "fun")
    println(canBreak("leetcode", dict))
    println(canBreak("scalaisfun", dict))
    println(canBreak("leetscala", dict))
    println(canBreak("nope", dict))
  }
}
