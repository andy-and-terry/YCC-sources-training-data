fun isPalindrome(s: String): Boolean {
    val cleaned = s.lowercase().filter { it.isLetterOrDigit() }
    return cleaned == cleaned.reversed()
}

fun main() {
    println(isPalindrome("A man a plan a canal Panama"))
    println(isPalindrome("hello"))
}
