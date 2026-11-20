// Remove consecutive duplicates with zipWithNext.
fun <T> List<T>.dedupe(): List<T> =
    if (isEmpty()) this else listOf(first()) + zipWithNext().filter { (a, b) -> a != b }.map { it.second }

fun main() = println("aabbbcdd".toList().dedupe().joinToString(""))
