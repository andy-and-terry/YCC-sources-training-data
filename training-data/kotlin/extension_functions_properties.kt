fun String.isPalindrome(): Boolean = filter { it.isLetterOrDigit() }.lowercase().let { it == it.reversed() }
val Int.isEven: Boolean get() = this % 2 == 0
fun <T> List<T>.second(): T? = getOrNull(1)
fun Int.times(f: () -> Unit) { repeat(this) { f() } }

fun main() {
    println("A man, a plan, a canal: Panama".isPalindrome())
    println(listOf(1, 2, 3).map { it.isEven })
    println(listOf("x", "y").second())
    3.times { print("hi ") }
    println()
}
