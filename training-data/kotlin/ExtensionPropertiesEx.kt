val String.isPalindrome: Boolean
    get() = this == reversed()

fun <T> List<T>.second(): T? = getOrNull(1)

fun main() {
    println("level".isPalindrome)
    println(listOf(1, 2, 3).second())
    println(emptyList<Int>().second())
}
