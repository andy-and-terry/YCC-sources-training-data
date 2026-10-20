inline fun <reified T> List<*>.filterByType(): List<T> = filterIsInstance<T>()
inline fun <reified T> typeName(): String = T::class.simpleName ?: "?"
inline fun measure(block: () -> Unit): Long { val s = System.nanoTime(); block(); return System.nanoTime() - s }

fun <T : Comparable<T>> maxOf3(a: T, b: T, c: T): T = maxOf(a, maxOf(b, c))

fun main() {
    println(listOf(1, "a", 2.5, 2).filterByType<Int>())
    println(typeName<String>() + typeName<List<Int>>())
    println(measure { (1..1000).sum() } >= 0)
    println(maxOf3("b", "z", "m"))
}
