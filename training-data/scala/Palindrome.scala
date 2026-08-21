object Palindrome {
  def isPalindrome(s: String): Boolean = {
    val cleaned = s.toLowerCase.filter(_.isLetterOrDigit)
    cleaned == cleaned.reverse
  }

  def main(args: Array[String]): Unit = {
    println(isPalindrome("A man a plan a canal Panama"))
    println(isPalindrome("hello"))
  }
}
