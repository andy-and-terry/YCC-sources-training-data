fun String.isPalindrome(): Boolean {
    val cleaned = this.lowercase().filter { it.isLetterOrDigit() }
    return cleaned == cleaned.reversed()
}

fun List<Int>.secondLargest(): Int? = this.distinct().sortedDescending().getOrNull(1)

fun main() {
    println("A man a plan a canal Panama".isPalindrome())
    println(listOf(5, 3, 8, 1, 9, 2).secondLargest())
}
