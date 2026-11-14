fun String.isPalindrome(): Boolean {
    val c = filter { it.isLetterOrDigit() }.lowercase()
    return c == c.reversed()
}

fun <T> List<T>.second(): T? = getOrNull(1)

fun main() {
    println("A man, a plan, a canal: Panama".isPalindrome())
    println(listOf(1, 2, 3).second())
}
