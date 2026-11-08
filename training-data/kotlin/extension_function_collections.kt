fun <T> List<T>.second(): T? = if (size >= 2) this[1] else null
fun String.vowelCount() = count { it.lowercaseChar() in "aeiou" }

fun main() {
    println(listOf(1, 2, 3).second())
    println(emptyList<Int>().second())
    println("Kotlin Rocks".vowelCount())
}
