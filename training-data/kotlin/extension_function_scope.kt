fun String.isPalindrome(): Boolean {
    val s = lowercase().filter { it.isLetterOrDigit() }
    return s == s.reversed()
}

val List<Int>.secondOrNull: Int? get() = getOrNull(1)

fun main() {
    println("A man, a plan, a canal: Panama".isPalindrome())
    println(listOf(1, 2, 3).secondOrNull)
}
